if (array_length(__LocalizeCache().asyncArray) == 0) {
    __LocalizeTrace(LOC_TRACE.VERBOSE, "All asynchronous files loaded!");
    instance_destroy();
}