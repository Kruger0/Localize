
///@func LocalizeGetLangs()
///@desc Returns an array containing the languages actives in the game.
function LocalizeGetLangs() {
    return __LocCache().gameTexts[$ LOC_LANG_KEY];
}
