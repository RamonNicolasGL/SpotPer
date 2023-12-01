CREATE DATABASE BDSpotPer
ON

PRIMARY
    (
        NAME = 'spotper',
        FILENAME = 'C:\BDSpotPer\spotper.mdf',
        SIZE = 5120KB,
        FILEGROWTH = 1024KB
    ),
    
FILEGROUP spotper_fg01
    (
        NAME = 'spotper_001',
        FILENAME = 'C:\BDSpotPer\spotper_001.ndf',
        SIZE = 1024KB,
        FILEGROWTH = 30%
    ),
    (
        NAME ='spotper_002',
        FILENAME = 'C:\BDSpotPer\spotper_002.ndf',
        SIZE = 1024KB,
        MAXSIZE = 3072KB,
        FILEGROWTH = 15%
    ),

FILEGROUP spotper_fg02
    (
    NAME = 'spotper_003',
    FILENAME = 'C:\BDSpotPer\spotper_003.ndf',
    SIZE = 2048KB,
    MAXSIZE = 5120KB,
    FILEGROWTH = 1024KB
    )

LOG ON
    (
    NAME = 'spotper_log',
    FILENAME = 'C:\BDSpotPer\spotper_log.ldf',
    SIZE = 1024KB,
    FILEGROWTH = 10%
    )
