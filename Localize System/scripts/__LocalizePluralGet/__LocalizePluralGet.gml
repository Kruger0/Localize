// feather ignore all
/// @ignore
function __LocalizePluralGet(langCode, count) {
    var _abs = abs(count);
    var _int = floor(_abs);
    if (_int == 0) return "_zero";
    switch (langCode) {
        case "zh":
        case "ja":
        case "ko": {
            return "_other";
        } break;
        
        case "fr":
        case "ff":
        case "hy":
        case "kab":{
            if (_int == 1) return "_one";
            return "_other";
        } break;
        
        case "ru":
        case "uk":
        case "bel": {
            var _mod10 = _int % 10;
            var _mod100 = _int % 100;
            if (_mod10 == 1 && _mod100 != 11) {
                return "_one";
            }
            if ((_mod10 >= 2 && _mod10 <= 4) && (_mod100 < 12 || _mod100 > 14)) {
                return "_few";
            }
            return "_many";
        } break;
        
        case "pl": {
            if (_int == 1) return "_one";
            var _mod10 = _int % 10;
            var _mod100 = _int % 100;
            if ((_mod10 >= 2 && _mod10 <= 4) && (_mod100 < 12 || _mod100 > 14)) {
                return "_few";
            }
            return "_many";
        }
        
        default: {
            if (_int == 1) return "_one";
            return "_other";
        } break;
    }
}