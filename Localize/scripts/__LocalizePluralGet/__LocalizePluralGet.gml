// feather ignore all
/// @ignore
function __LocalizePluralGet(langCode, count) {
    var _abs = abs(count);
    var _int = floor(_abs);
    if (_int == 0) return "_zero";
    switch (langCode) {
        case "zh":
        case "ja":
        case "ko":
        case "vi":
        case "th":
        case "id":
        case "tr": {
            return "_other";
        } break;
        
        case "ar": {
            if (_int == 1) return "_one";
            if (_int == 2) return "_two";
            var _mod100 = _int % 100;
            if (_mod100 >= 3 && _mod100 <= 10) return "_few";
            if (_mod100 >= 11 && _mod100 <= 99) return "_many";
            return "_other";
        } break;
        
        case "cs":
        case "sk": {
            if (_int == 1) return "_one";
            if (_int >= 2 && _int <= 4) return "_few";
            return "_other";
        } break;
        
        case "ro": {
            if (_int == 1) return "_one";
            var _mod100 = _int % 100;
            if (_int != 0 && (_mod100 >= 1 && _mod100 <= 19)) return "_few";
            return "_other";
        } break;
        
        case "fr":
        case "ff":
        case "hy":
        case "kab": {
            if (_int == 1) return "_one";
            return "_other";
        } break;
        
        case "ru":
        case "uk":
        case "be": {
            var _mod10 = _int % 10;
            var _mod100 = _int % 100;
            if (_mod10 == 1 && _mod100 != 11) return "_one";
            if ((_mod10 >= 2 && _mod10 <= 4) && (_mod100 < 12 || _mod100 > 14)) return "_few";
            return "_many";
        } break;
        
        case "pl": {
            if (_int == 1) return "_one";
            var _mod10 = _int % 10;
            var _mod100 = _int % 100;
            if ((_mod10 >= 2 && _mod10 <= 4) && (_mod100 < 12 || _mod100 > 14)) return "_few";
            return "_many";
        } break;
        
        default: {
            if (_int == 1) return "_one";
            return "_other";
        } break;
    }
}