/* Types */
typedef int  hostState;
typedef int  timeout;
typedef char hostName[16];

/* Structures */
struct hostInfo {
     hostName host;
     timeout duration;
};
struct hostStatus {
     hostInfo host;
     timeout duration;
};

hostStatus hostsList<>;

/* Host state values */
enum hostStateOptions {
    SLEEP     = 0,
    AVAILIBLE = 1
};

/* Timeout constants in sec */
const STANDART_TIMEOUT = 60;
const MANUAL_FORCE_TIMEOUT = 0;

/* API */
program PINGER {
    version PINGER_VERS_1 {
        hostState
            getHostState(hostName) = 0;

        hostsList
            getAllHostStates() = 1;

        hostState
            forcePingHost(hostName) = 2;

        hostsList
            forcePingAllHosts() = 3;

        void
            setHostTimeout(hostInfo) = 4;

        void
            setGlobalTimeout(timeout) = 5;

        void
            addHost(hostInfo) = 6;

        void
            remoteHost(hostName) = 7;    
    } = 1;
} = 200000;