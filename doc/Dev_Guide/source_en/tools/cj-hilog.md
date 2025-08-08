# hilog

HiLog is a logging system provided for system frameworks, services, and applications to print logs, record user operations, and track system runtime status. Developers can query relevant log information through the hilog command-line interface.

## Environment Requirements

- Complete [environment preparation](./cj-hdc.md#environment-preparation) according to the hdc command-line tool guide.
- Ensure the device is properly connected and execute `hdc shell`.

## Command-Line Options

| Short Option | Long Option | Parameter | Description |
| ------------ | ----------- | --------- | ----------- |
| -h | --help | - | Help command. |
| Default | Default | - | Blocking log read, does not exit. |
| -x | --exit | - | Non-blocking log read, exits after completion. |
| -g | - | - | Query buffer size, used with -t to specify a type (default: app and core). |
| -G | --buffer-size | &lt;size&gt; | Set buffer size for specified &lt;type&gt; (default: app and core). Units: B/K/M, range: 64K-16M. |
| -r | - | - | Clear buffer logs, used with -t to specify a type (default: app and core). |
| <!--DelRow-->-p | --privacy | &lt;on/off&gt; | Control privacy switch for system debugging logs. |
| <!--DelRow--> |  | on | Enable privacy switch, displays &lt;private&gt;. |
| <!--DelRow--> |  | off | Disable privacy switch, displays plaintext. |
| -k | - | &lt;on/off&gt; | Kernel log read switch control. |
|  |  | on | Enable kernel log reading. |
|  |  | off | Disable kernel log reading. |
| -s | --statistics | - | Query statistics, requires -t or -D. |
| -S | - | - | Clear statistics, requires -t or -D. |
| -Q | - | &lt;control-type&gt; | Flow control quota switch. |
|  |  | pidon | Enable process flow control. |
|  |  | pidoff | Disable process flow control. |
|  |  | domainon | Enable domain flow control. |
|  |  | domainoff | Disable domain flow control. |
| -L | --level | &lt;level&gt; | Filter logs by level (e.g., -L D/I/W/E/F). |
| -t | --type | &lt;type&gt; | Filter logs by type (e.g., -t app/core/init/only_prerelease). `app` for application logs, `core` for system logs, `init` for boot logs, `only_prerelease` for pre-release system logs (irrelevant to app developers). |
| -D | --domain | &lt;domain&gt; | Filter logs by domain. |
| -T | --tag | &lt;tag&gt; | Filter logs by tag. |
| -a | --head | &lt;n&gt; | Display first &lt;n&gt; log lines. |
| -z | --tail | &lt;n&gt; | Display last &lt;n&gt; log lines. |
| -P | --pid | &lt;pid&gt; | Filter logs by process ID. |
| -e | --regex | &lt;expr&gt; | Filter logs matching regex &lt;expr&gt;. |
| -f | --filename | &lt;filename&gt; | Set log dump filename. |
| -l | --length | &lt;length&gt; | Set log dump file size (min: 64K). |
| -n | --number | &lt;number&gt; | Set number of log dump files. |
| -j | --jobid | &lt;jobid&gt; | Set log dump task ID. |
| -w | --write | &lt;control&gt; | Log dump task control. |
|  |  | query | Query log dump task. |
|  |  | start | Start log dump task (params: filename, file size, algorithm, rotate count). |
|  |  | stop | Stop log dump task. |
|  |  | refresh | Flush buffer logs to dump file. |
|  |  | clear | Delete dumped log files. |
| -m | --stream | &lt;algorithm&gt; | Log dump compression control. |
|  |  | none | No compression. |
|  |  | zlib | Zlib compression (.gz). |
|  |  | zstd | Zstd compression (.zst). |
| -v | --format | &lt;format&gt; | Display format control. |
|  |  | time | Show local time. |
|  |  | color | Color-code log levels (default: monochrome). |
|  |  | epoch | Show time since 1970. |
|  |  | monotonic | Show time since boot. |
|  |  | usec | Show microsecond precision. |
|  |  | nsec | Show nanosecond precision. |
|  |  | year | Show year in timestamp. |
|  |  | zone | Show timezone in timestamp. |
|  |  | wrap | Disable timestamp prefix for wrapped lines. |
| -b | --baselevel | &lt;loglevel&gt; | Set minimum log level: D(DEBUG)/I(INFO)/W(WARN)/E(ERROR)/F(FATAL). |

## Common Commands

### View Help

```shell
hilog -h
```

**Example:**

```shell
$ hilog -h
Usage:
-h --help
Show all help information.
Show single help information with option:
query/clear/buffer/stats/persist/private/kmsg/flowcontrol/baselevel/domain/combo
Querying logs options:
No option performs a blocking read and keeps printing.
-x --exit
   Performs a non-blocking read and exits when all logs in buffer are printed.
-a <n>, --head=<n>
   Show n lines logs on head of buffer.
-z <n>, --tail=<n>
   Show n lines logs on tail of buffer.
```

### Non-Blocking Log Read

```shell
hilog -x
```

**Example:**

```shell
$ hilog -x
11-15 15:51:02.087  2823  2823 I A01B05/com.ohos.sceneboard/AOD: AodClockFullScreen --> timeTextLineHeight:313.3333333333333 clockMarginTop:99
11-15 15:51:02.087  2823  2823 I A01B05/com.ohos.sceneboard/AOD: AodClockFullScreen --> timeFontSize:114.48717948717947
11-15 15:51:02.090  2823  2823 I A01B05/com.ohos.sceneboard/AOD: AodClockFullScreen --> timeTextWidth:202,timeTextHeight:292
11-15 15:51:02.100  2823  2823 I A01B05/com.ohos.sceneboard/AOD: ComponentUtil --> Component(ComponentId-AodClockNumber) draw complete.
11-15 15:51:02.110  1197  1197 E C01406/render_service/OHOS::RS: [LoadImgsbyResolution] Can't find resolution (1084 x 2412) in config file
11-15 15:51:02.127  1197  1197 E C01406/render_service/OHOS::RS: [LoadImgsbyResolution] Can't find resolution (1084 x 2412) in config file
```

### Query Log Buffer Size

```shell
hilog -g
```

**Example:**

```shell
$ hilog -g
Log type app buffer size is 16.0M
Log type init buffer size is 16.0M
Log type core buffer size is 16.0M
Log type only_prerelease buffer size is 16.0M
```

### Modify Log Buffer Size

```shell
hilog -G size
```

**Example:**

```shell
$ hilog -G 16M
Set log type app buffer size to 16.0M successfully
Set log type init buffer size to 16.0M successfully
Set log type core buffer size to 16.0M successfully
Set log type only_prerelease buffer size to 16.0M successfully
```

### Clear Buffer Logs

```shell
hilog -r
```

**Example:**

```shell
$ hilog -r
Log type core,app,only_prerelease buffer clear successfully
```

### Kernel Log Read Control

```shell
hilog -k on/off
```

**Example:**

```shell
$ hilog -k on
Set hilogd storing kmsg log on successfully
$
$ hilog -k off
Set hilogd storing kmsg log off successfully
```

### Query Statistics

```shell
hilog -s
```

**Example:**

```shell
$ param set persist.sys.hilog.stats true
Set parameter persist.sys.hilog.stats true success
$ reboot
$ hilog -s
Log statistic report (Duration: 0h0m32s.564, From: 11-15 16:04:08.628):
Total lines: 137517, length: 8.0M
DEBUG lines: 0(0%), length: 0.0B(0%)
INFO lines: 101795(74%), length: 6.1M(76%)
WARN lines: 10268(7.5%), length: 719.9K(8.8%)
ERROR lines: 25452(19%), length: 1.2M(15%)
FATAL lines: 2(0.0015%), length: 259.0B(0.0031%)
------------------------------------------------------------
Domain Table:
LOGTYPE- DOMAIN---- TAG----------------------------- MAX_FREQ-- TIME---------------- MAX_TP---- TIME---------------- LINES----- LENGTH---- DROPPED---
app----- 0xf00----- -------------------------------- 924.00---- 11-15 16:04:25.594-- 111975.00- 11-15 16:04:25.594-- 3386------ 371.5K---- 0---------
app----- 0x0------- -------------------------------- 285.00---- 11-15 16:04:34.877-- 44242.00-- 11-15 16:04:34.877-- 990------- 129.2K---- 0---------
```

**Statistics Explanation:**

```shell
MAX_FREQ: Highest log frequency (lines/sec)
TIME:    Timestamp of occurrence
MAX_TP:  Highest throughput (bytes/sec)
LINES:   Total lines in period
LENGTH:  Total bytes in period
DROPPED: Dropped lines in period
```

### Clear Statistics

```shell
hilog -S
```

**Example:**

```shell
$ hilog -S
Statistic info clear successfully
```

### Process Flow Control

```shell
hilog -Q pidon/pidoff
```

**Example:**

```shell
$ hilog -Q pidon
Set flow control by process to enabled successfully
$
$ hilog -Q pidoff
Set flow control by process to disabled successfully
```

### Domain Flow Control

```shell
hilog -Q domainon/domainoff
```

**Example:**

```shell
$ hilog -Q domainon
Set flow control by domain to enabled successfully
$
$ hilog -Q domainoff
Set flow control by domain to disabled successfully
```

### Filter Logs by Level

```shell
hilog -L D/I/W/E/F
```

**Example:**

```shell
$ hilog -L E
08-28 09:01:25.730  2678  2678 E A00F00/com.aidataservice/AiDataService_5.10.7.320: DataChangeNotifyManager: notifyDataChange CommonEntity no valid entity to notify
08-28 09:01:56.058  8560  8560 E A00500/com.ohos.settingsdata/SettingsData: DB not ready request = datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key=analysis_service_switch_on , retry after DB startup
08-28 09:01:56.082  8560  8560 E A00500/com.ohos.settingsdata/SettingsData: decoder failure: /data/migrate/settings_global.xml , error code:-1
08-28 09:01:56.082  8560  8560 E A00500/com.ohos.settingsdata/SettingsData: clearXml failed:No such file or directory, error code:13900002
08-28 09:01:56.083  8560  8560 E A00500/com.ohos.settingsdata/SettingsData: readText failed:No such file or directory, error code:13900002
08-28 09:01:56.371  8586  8586 E A00500/com.ohos.settingsdata/SettingsData: DB not ready request =    datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key=photo_network_connection_status , retry after DB startup
08-28 09:01:56.408  8586  8586 E A00500/com.ohos.settingsdata/SettingsData: decoder failure: /data/migrate/settings_global.xml , error code:-1
```

### Filter Logs by Type

```shell
hilog -t app
```

**Example:**

```shell
$ hilog -t app
11-15 16:04:45.903  5630  5630 I A0A5A5/os.hiviewcare:staticSubscriber/Diagnosis: [DetectionFilter]820001084: switch off
11-15 16:04:45.905  5630  5630 I A0A5A5/os.hiviewcare:staticSubscriber/Diagnosis: [DetectionFilter]847005050: frequency limit
11-15 16:04:45.905  5630  5630 I A0A5A5/os.hiviewcare:staticSubscriber/Diagnosis: [SmartNotifyHandler]detections after filter: []
11-15 16:04:45.905  5630  5630 I A0A5A5/os.hiviewcare:staticSubscriber/Diagnosis: [SmartNotifyHandler]no detections to detect
11-15 16:04:45.924  5687  5687 I A01B06/common/KG: MetaBalls-SystemTopPanelController --> init charging status = 3
```

### Filter Logs by Domain

```shell
hilog -D 01B06
```
**Example:**

```shell
$ hilog -D 01B06
11-15 16:04:54.981  5687  5687 I A01B06/common/KG: MetaBalls-MetaBallRenderer --> pressTime = 0 appearTime = 1731657885972
11-15 16:04:54.981  5687  5687 I A01B06/common/KG: MetaBalls-MetaBallRenderer --> backAnimator on finish
11-15 16:04:54.982  5687  5687 I A01B06/common/KG: MetaBalls-MetaBallRenderer --> setTimeout over 9s and begin animate on finish
11-15 16:04:55.297  5687  5687 I A01B06/common/KG: MetaBalls-MetaBallRenderer --> chargingTextExitAnimation onFinish
11-15 16:04:55.494  5687  5687 I A01B06/common/KG: MetaBalls-MetaBallRenderer --> uiExtension session send data success,type: exitAnimationFinish
```

### View Logs by Specified TAG

```shell
hilog -T tag
```

**Usage Example:**

```shell
$ hilog -T SAMGR
08-28 09:27:59.581   610 11504 I C01800/samgr/SAMGR: CommonEventCollect save extraData 1661
08-28 09:27:59.581   610 11504 I C01800/samgr/SAMGR: OnReceiveEvent get action: usual.event.BATTERY_CHANGED code: 0, extraDataId 1661
08-28 09:27:59.582   610 11504 I C01800/samgr/SAMGR: DoEvent:4 name:usual.event.BATTERY_CHANGED value:0
08-28 09:27:59.582   610 11504 W C01800/samgr/SAMGR: LoadSa SA:10120 AddDeath fail,cnt:1,callpid:610
08-28 09:27:59.583   610 11504 I C01800/samgr/SAMGR: LoadSa SA:10120 size:1,count:1
08-28 09:27:59.601   610 11504 I C01800/samgr/SAMGR: Scheduler SA:10120 loading
08-28 09:27:59.965 11518 11518 I C01800/media_analysis_service/SAMGR: SA:10120 OpenSo spend 315ms
08-28 09:27:59.965   610  4064 I C01800/samgr/SAMGR: AddProc:media_analysis_service. size:75
```

### View First n Lines of Buffer Logs

```shell
hilog -a 8
```

**Usage Example:**

```shell
$ hilog -a 8
11-15 16:04:08.628     0     0 I I00000/HiLog: ========Zeroth log of type: init
11-15 16:04:08.603   506   506 I I02C01/cust_carrier_mount/CustCarrierMount: MountCarrierToShared start
11-15 16:04:08.604   506   506 I I02C01/cust_carrier_mount/CustCarrierMount: success to mount carrier to shared
11-15 16:04:15.394   972   972 I I02C01/cust_carrier_mount/CustCarrierMount: UpdateCotaOpkeyLink start
11-15 16:04:15.396   972   972 W I02C01/cust_carrier_mount/CustCarrierMount: not exsit CUST_GLOBAL_CARRIER_DIR or COTA_PARAM_CARRIER_DIR
11-15 16:04:15.887   972   972 I I02C01/cust_carrier_mount/CustCarrierMount: success to update cota carrier
11-15 16:04:48.749  5777  5901 I A00001/com.hiai.core/HiAI_Metadata: metadata is null
11-15 16:04:48.749  5777  5901 I A00001/com.hiai.core/HiAI_PluginAbilityInfo: abilityInfo is null
```

### View Last n Lines of Buffer Logs

```shell
hilog -z 8
```

**Usage Example:**

```shell
$ hilog -z 8
11-15 16:12:19.015  1899  7867 W C01719/wifi_manager_service/ffrt: 423:FFRTQosApplyForOther:244 tid 7867, Operation not permitted, ret:-1, eno:1
11-15 16:12:19.125  1043  1072 I C01C42/time_service/TimeService: uid: 1010 id:428551571 name:wifi_manager_service wk:0
11-15 16:12:19.125  1043  1072 I C01C42/time_service/TimeService: bat: -1 id:428551571 we:505225000000 mwe:512725000000
11-15 16:12:19.125  1043  1072 I C01C42/time_service/TimeService: typ:3 trig: 505 225000000, bt: 495230369193
11-15 16:12:19.125  1043  1072 I C01C42/time_service/TimeService: cb: 428551571 ret: 0
11-15 16:12:19.435  3086  7813 I C01719/com.ohos.contactsdataability/ffrt: 45:~WorkerThread:72 to exit, qos[3]
11-15 16:12:19.691   800  1404 I C01713/resource_schedule_service/SUSPEND_MANAGER: [(HasSpecialStateFromBgtask):759] 20020107_com.ohos.medialibrary.medialibrarydata
11-15 16:12:19.691   800  1404 I C01713/resource_schedule_service/SUSPEND_MANAGER: [(DozeFreezeUnit):890] Doze has special:ERR_HAS_PID_EFFICIENCY_RESOURCE
```

### View Logs by Specified Process

```shell
hilog -P pid
```

**Usage Example:**

```shell
$ hilog -P 618
08-28 10:19:16.872   618 17729 I C02D15/hiview/XPower: [task_52]#current system load is: 0.028767
08-28 10:19:23.997   618 17580 I C02D10/hiview/CpuCollector: CalculateProcessCpuStatInfos: startTime=1724811553746, endTime=1724811563996, startBootTime=47001084, endBootTime=47011335, period=10251
08-28 10:19:23.999   618 17580 I C02D10/hiview/CpuCollector: CollectProcessCpuStatInfos: collect process cpu statistics information size=234, isNeedUpdate=1
08-28 10:19:24.002   618 17580 W C01650/hiview/Rdb:  DB :
08-28 10:19:24.002   618 17580 W C01650/hiview/Rdb:  device: 12583051 inode: 40230 mode: 432 size: 569344 natime: Wed Aug 28 00:00:06 2024
08-28 10:19:24.002   618 17580 W C01650/hiview/Rdb:  smtime: Wed Aug 28 00:34:30 2024
08-28 10:19:24.002   618 17580 W C01650/hiview/Rdb:  sctime: Wed Aug 28 00:34:30 2024
```

### View Logs Matching Regex Keywords

```shell
hilog -e start
```

**Usage Example:**

```shell
$ hilog -e start
11-15 16:17:17.578   547  4504 I C01800/samgr/SAMGR: AddProc start proc:media_analysis_service spend 223ms
11-15 16:17:17.578   547  4504 I C01800/samgr/SAMGR: Scheduler proc:media_analysis_service handle started event
11-15 16:17:17.578   547  4504 I C01800/samgr/SAMGR: Scheduler proc:media_analysis_service started
11-15 16:17:17.580  8877  8877 I C01810/media_analysis_service/SAFWK: start tasks proc:media_analysis_service end,spend 1ms
11-15 16:17:17.582  8877  8877 I C01651/media_analysis_service/DataShare: [operator()()-data_share_manager_impl.cpp:134]: RecoverObs start
11-15 16:17:17.589  8877  8893 I C01651/media_analysis_service/DataShare: [Connect()-ams_mgr_proxy.cpp:67]: connect start, uri = ******/media
11-15 16:17:18.225  1155  1633 I C02943/power_host/TermalHdi: CreateLogFile start
11-15 16:17:18.264  1155  1633 I C02943/power_host/ThermalHdi: CompressFile start
```

### View and Configure Log Persistence Tasks

```shell
hilog -w control
```

> **Note:**
>
> Query current task: hilog -w query
>
> Start hilog persistence task with 1000 log files: hilog -w start -n 1000
>
> Start kmsglog persistence task with 100 log files: hilog -w start -n 100 -t kmsg
>
> Stop current persistence task: hilog -w stop
>
> Start kmsglog persistence task with configuration rules (compression methods: zlib, zstd, none). Example configuration: filename=kmsglog, size=2M, count=100, compression=zlib. Command: hilog -w start -t kmsg -f kmsglog -l 2M -n 100 -m zlib

**Usage Example:**

```shell
$ hilog -w query
Persist task query failed
No running persistent task [CODE: -63]
$
$ hilog -w start -n 1000
Persist task [jobid:1][fileNum:1000][fileSize:4194304] start successfully
$
$ hilog -w start -n 100 -t kmsg
Persist task [jobid:2][fileNum:100][fileSize:4194304] start successfully
$
$ hilog -w stop
Persist task [jobid:1] stop successfully
Persist task [jobid:2] stop successfully
$
$ hilog -w start -t kmsg -f kmsglog -l 2M -n 100 -m zlib
Persist task [jobid:2][fileNum:100][fileSize:2097152] start successfully
```

### Configure Log Display Format

```shell
hilog -v time/color/epoch/monotonic/usec/nsec/year/zone/wrap
```

**Usage Example:**

```shell
$ hilog -v time
11-15 16:36:21.027  1134  1723 I C02B01/riladapter_host/HrilExt: [NotifyToBoosterTel-(hril_manager_ext.cpp:440)] RilExt:Notify to booster tel finish
11-15 16:36:21.027  1134  1723 I C02B01/riladapter_host/HrilExt: [NotifyToBoosterNet-(hril_manager_ext.cpp:450)] RilExt: HNOTI_BOOSTER_NET_IND report to booster net
11-15 16:36:21.027  1134  1723 I C02B01/riladapter_host/HrilExt: [NotifyToBoosterNet-(hril_manager_ext.cpp:454)] RilExt: HNOTI_BOOSTER_NET_IND report to booster net finish
11-15 16:36:21.027  1134  1723 I P01FFF/riladapter_host/Rilvendor: CHAN [HandleUnsolicited] HandleUnsolicited done for modem:0, index:0, atResponse:^BOOSTERNTF: 3, 20,"0600100001000004000000000102A4FF0202F6FF"
11-15 16:36:21.802  2809  2831 E C02D06/com.ohos.sceneboard/XCollie: Send kick,foundation to hungtask Successful
11-15 16:36:21.911   882  3016 I C01F0B/telephony/TelephonyVSim: state machine ProcessEvent Id: 125
11-15 16:36:21.911   882  3016 I C01F0B/telephony/TelephonyVSim: StateProcess
$
$ hilog -v nsec
11-15 16:37:09.010658555  1134  1723 I C02B01/riladapter_host/HrilExt: [BoosterRawInd-(hril_booster.cpp:296)] RilExt: BoosterRawInd
11-15 16:37:09.010676263  1134  1723 I C02B01/riladapter_host/HrilExt: [BoosterRawInd-(hril_booster.cpp:328)] check need notify to satellite:indType 6
11-15 16:37:09.010800221  1134  1723 I C02B01/riladapter_host/HrilExt: [NotifyToBoosterTel-(hril_manager_ext.cpp:436)] RilExt: report to telephony ext, requestNum: 4201
11-15 16:37:09.011011680  1134  1723 I C02B01/riladapter_host/HrilExt: [NotifyToBoosterTel-(hril_manager_ext.cpp:440)] RilExt:Notify to booster tel finish
11-15 16:37:09.011064805  1134  1723 I C02B01/riladapter_host/HrilExt: [NotifyToBoosterNet-(hril_manager_ext.cpp:450)] RilExt: HNOTI_BOOSTER_NET_IND report to booster net
11-15 16:37:09.011200742  1134  1723 I C02B01/riladapter_host/HrilExt: [NotifyToBoosterNet-(hril_manager_ext.cpp:454)] RilExt: HNOTI_BOOSTER_NET_IND report to booster net finish
```

### View and Configure Log Levels

```shell
// Default global log level is Info. Query global log level:
param get param get hilog.loggable.global

// Set global log level:
hilog -b D/I/W/E/F

// Set printable log level for [DOMAINID]:
hilog -b D/I/W/E/F -D [DOMAINID]

// Set printable log level for [TAG]:
hilog -b D/I/W/E/F -T [TAG]

// Set global log level persistently (survives reboot):
hilog -b D/I/W/E/F --persist
```

**Usage Example:**

```shell
$ param get hilog.loggable.global
I

$ hilog -b E
Set global log level to E successfully

$ hilog -b D -D 0x2d00
Set domain 0x2d00 log level to D successfully

$ hilog -b E -T testTag
Set tag testTag log level to E successfully
```

<!--Del-->
### Privacy Switch

```shell
hilog -p on/off
```

**Usage Example:**

```shell
# hilog -p on
Set hilog privacy format on successfully
#
# hilog -p off
Set hilog privacy format off successfully
```

<!--DelEnd-->
```