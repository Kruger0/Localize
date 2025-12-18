// feather ignore all
/// @ignore
function __LocalizeOrdinalGet(langCode, value) {
    var _int = floor(abs(value));
    if (_int == 0) return "_zero"; 
    switch (langCode) {
        case "en": {
            var _mod10 = _int % 10;
            var _mod100 = _int % 100;
            
            if (_mod10 == 1 && _mod100 != 11) return "_one"; // st
            if (_mod10 == 2 && _mod100 != 12) return "_two"; // nd
            if (_mod10 == 3 && _mod100 != 13) return "_few"; // rd
            return "_other";                                 // th
        } break;
        
        case "sv": {
            var _mod10 = _int % 10;
            var _mod100 = _int % 100;
            if ((_mod10 == 1 || _mod10 == 2) && (_mod100 != 11 && _mod100 != 12)) {
                return "_one"; // :a
            }
            return "_other";   // :e
        } break;
        
        case "fr":
        case "mq":
        case "ga":
        case "nl": {
            if (_int == 1) return "_one"; // 1er
            return "_other";              // e
        } break;
        
        default: {
            return "_other"; // º
        } break;
    }
}