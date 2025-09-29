/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

// @jujuadams 2023-01-02
// Modified snap_from_csv

/// @desc Decodes an CSV string and outputs a 2D array
/// @return 2D array that represents the contents of the CSV string
/// @param buffer Buffer to read data from
/// @ignore
function __LocalizeLoadCsv(buffer) {
    buffer_seek(buffer, buffer_seek_start, 0);
    var _size = buffer_get_size(buffer);
    
    var _restorePos  = _size + buffer_tell(buffer);
    var _restoreByte = undefined;
    if (_restorePos < buffer_get_size(buffer)) {
        _restoreByte = buffer_peek(buffer, _restorePos, buffer_u8);
        buffer_poke(buffer, _restorePos, buffer_u8, 0x00);
    } else {
        buffer_resize(buffer, buffer_get_size(buffer)+1);
    }
    
    var _cellDelimiterOrd      = ord(LOC_CELL_DELIM);
    var _stringDelimiterDouble = LOC_STRING_DELIM + LOC_STRING_DELIM;
    var _stringDelimiterOrd    = ord(LOC_STRING_DELIM);
    
    var _rootArray = [];
    var _rowArray  = undefined;
    
    var _newline    = false;
    var _read       = false;
    var _wordStart  = 0;
    var _inString   = false;
    var _stringCell = false;
    
    repeat(_size+1) {
        var _value = buffer_read(buffer, buffer_u8);
        
        if (_value == _stringDelimiterOrd) {
            _inString = !_inString;
            if (_inString) _stringCell = true;
        } else {
            if (_value == 0x00) {
                if (_inString) {
                    _stringCell = true;
                }
                _inString = false;
                
                var _prev_value = buffer_peek(buffer, buffer_tell(buffer)-2, buffer_u8);
                if ((_prev_value != _cellDelimiterOrd) && (_prev_value != 0x0A) && (_prev_value != 0x0D)) {
                    _read = true;
                } else {
                    break;
                }
            }
            
            if (!_inString) {
                if ((_value == 0x0A) || (_value == 0x0D)) {
                    var _prev_value = buffer_peek(buffer, buffer_tell(buffer)-2, buffer_u8);
                    if ((_prev_value != 0x0A) && (_prev_value != 0x0D)) {
                        _newline = true;
                        if (_prev_value != _cellDelimiterOrd) {
                            _read = true;
                        } else {
                            ++_wordStart;
                        }
                    } else {
                        ++_wordStart;
                    }
                }
            
                if (_read || (_value == _cellDelimiterOrd)) {
                    _read = false;
                    
                    var _tell = buffer_tell(buffer);
                    var _old_value = buffer_peek(buffer, _tell-1, buffer_u8);
                    buffer_poke(buffer, _tell-1, buffer_u8, 0x00);
                    buffer_seek(buffer, buffer_seek_start, _wordStart);
                    var _string = buffer_read(buffer, buffer_string);
                    buffer_poke(buffer, _tell-1, buffer_u8, _old_value);
                    
                    if (_stringCell) {
                        if ((string_byte_at(_string, 1) == _stringDelimiterOrd)
                        &&  (string_byte_at(_string, string_byte_length(_string)) == _stringDelimiterOrd)) {
                            _string = string_copy(_string, 2, string_length(_string)-2); //Trim off leading/trailing quote marks
                        }
                    }
                    
                    _string = string_replace_all(_string, _stringDelimiterDouble, LOC_STRING_DELIM); //Replace double quotes with single quotes
                    
                    if (_rowArray == undefined) {
                        _rowArray = [];
                        _rootArray[@ array_length(_rootArray)] = _rowArray;
                    }
                    
                    _rowArray[@ array_length(_rowArray)] = _string;
                    
                    _stringCell = false;
                    _wordStart = _tell;
                    
                    if (_value == 0x00) break;
                }
            
                if (_newline) {
                    _newline = false;
                    _rowArray = undefined;
                }
            }
        }
    }
    
    if (_restoreByte == undefined) {
        buffer_resize(buffer, buffer_get_size(buffer)-1);
    } else {
        buffer_poke(buffer, _restorePos, buffer_u8, _restoreByte);
    }
    
    return _rootArray;
}