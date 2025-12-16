// feather ignore all

// ======================== System Info
#macro __LOC_VERSION        "2.0.0-beta.8"
#macro __LOC_DATE           "2025-12-15"

// ======================== Internal Keys
#macro __LOC_CMD_LANGNAME   "LOC_LANGNAME"
#macro __LOC_CMD_FONTNAME   "LOC_FONTNAME"
#macro __LOC_CMD_PRODUCTION "LOC_PRODUCTION"

// ======================== Configuration Enums
enum LOC_TRACE {
    DISABLED,
    CRITICAL,
    VERBOSE,
}

enum LOC_UPDATE {
    DISABLED,
    DEVELOPMENT,
    PRODUCTION,
}