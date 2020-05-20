<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="SDA" />
        <signal name="SCL" />
        <signal name="NACK" />
        <signal name="CLK" />
        <signal name="XLXN_60" />
        <signal name="RST" />
        <signal name="XLXN_62" />
        <signal name="XLXN_63(7:0)" />
        <signal name="XLXN_65" />
        <signal name="XLXN_66" />
        <signal name="XLXN_68(7:0)" />
        <signal name="XLXN_69" />
        <signal name="XLXN_70(7:0)" />
        <signal name="DRX(15:0)" />
        <signal name="DRY(15:0)" />
        <signal name="DRZ(15:0)" />
        <signal name="XLXN_71(15:0)" />
        <signal name="XLXN_72(15:0)" />
        <signal name="XLXN_73(3:0)" />
        <signal name="XLXN_74(7:0)" />
        <signal name="XLXN_76(7:0)" />
        <signal name="XLXN_77" />
        <signal name="XLXN_78" />
        <signal name="XLXN_80" />
        <signal name="XLXN_88(7:0)" />
        <signal name="XLXN_89(7:0)" />
        <signal name="XLXN_90(3:0)" />
        <signal name="XLXN_116" />
        <signal name="XLXN_117" />
        <signal name="XLXN_118(7:0)" />
        <signal name="XLXN_119" />
        <signal name="READ_Ready" />
        <signal name="XLXN_67(3:0)" />
        <port polarity="BiDirectional" name="SDA" />
        <port polarity="BiDirectional" name="SCL" />
        <port polarity="Output" name="NACK" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="RST" />
        <port polarity="Output" name="DRX(15:0)" />
        <port polarity="Output" name="DRY(15:0)" />
        <port polarity="Output" name="DRZ(15:0)" />
        <port polarity="Output" name="READ_Ready" />
        <blockdef name="I2C_Master">
            <timestamp>2015-11-24T13:12:50</timestamp>
            <rect width="336" x="64" y="-512" height="572" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="464" y1="-480" y2="-480" x1="400" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="464" y1="-256" y2="-256" x1="400" />
            <line x2="464" y1="-192" y2="-192" x1="400" />
            <rect width="64" x="400" y="-140" height="24" />
            <line x2="464" y1="-128" y2="-128" x1="400" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
            <line x2="464" y1="32" y2="32" x1="400" />
        </blockdef>
        <blockdef name="HMC5883L_read">
            <timestamp>2020-5-19T10:5:3</timestamp>
            <rect width="400" x="64" y="-640" height="640" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-496" y2="-496" x1="64" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-60" height="24" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="528" y1="-608" y2="-608" x1="464" />
            <line x2="528" y1="-544" y2="-544" x1="464" />
            <line x2="528" y1="-480" y2="-480" x1="464" />
            <line x2="528" y1="-416" y2="-416" x1="464" />
            <rect width="64" x="464" y="-364" height="24" />
            <line x2="528" y1="-352" y2="-352" x1="464" />
            <rect width="64" x="464" y="-300" height="24" />
            <line x2="528" y1="-288" y2="-288" x1="464" />
            <rect width="64" x="464" y="-236" height="24" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <rect width="64" x="464" y="-172" height="24" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <rect width="64" x="464" y="-108" height="24" />
            <line x2="528" y1="-96" y2="-96" x1="464" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
        </blockdef>
        <block symbolname="I2C_Master" name="XLXI_2">
            <blockpin signalname="XLXN_78" name="Go" />
            <blockpin signalname="XLXN_68(7:0)" name="Address(7:0)" />
            <blockpin signalname="XLXN_67(3:0)" name="ReadCnt(3:0)" />
            <blockpin signalname="SDA" name="SDA" />
            <blockpin signalname="SCL" name="SCL" />
            <blockpin signalname="XLXN_80" name="FIFO_Pop" />
            <blockpin signalname="XLXN_77" name="FIFO_Push" />
            <blockpin signalname="XLXN_70(7:0)" name="FIFO_DI(7:0)" />
            <blockpin signalname="XLXN_117" name="FIFO_Empty" />
            <blockpin signalname="XLXN_119" name="FIFO_Full" />
            <blockpin signalname="XLXN_63(7:0)" name="FIFO_DO(7:0)" />
            <blockpin signalname="RST" name="Reset" />
            <blockpin signalname="CLK" name="Clk" />
            <blockpin signalname="XLXN_62" name="Busy" />
            <blockpin signalname="NACK" name="NACK" />
        </block>
        <block symbolname="HMC5883L_read" name="XLXI_3">
            <blockpin signalname="RST" name="RST" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="XLXN_62" name="I2C_Busy" />
            <blockpin signalname="XLXN_117" name="I2C_FIFO_Empty" />
            <blockpin signalname="XLXN_119" name="I2C_FIFO_FULL" />
            <blockpin signalname="XLXN_63(7:0)" name="I2C_FIFO_DO(7:0)" />
            <blockpin signalname="XLXN_80" name="I2C_FIFO_Pop" />
            <blockpin signalname="XLXN_78" name="I2C_Go" />
            <blockpin signalname="XLXN_77" name="I2C_FIFO_Push" />
            <blockpin signalname="READ_Ready" name="READ_Ready" />
            <blockpin signalname="XLXN_68(7:0)" name="I2C_Address(7:0)" />
            <blockpin signalname="XLXN_70(7:0)" name="I2C_FIFO_DI(7:0)" />
            <blockpin signalname="XLXN_67(3:0)" name="I2C_ReadCnt(3:0)" />
            <blockpin signalname="DRX(15:0)" name="DRX(15:0)" />
            <blockpin signalname="DRY(15:0)" name="DRY(15:0)" />
            <blockpin signalname="DRZ(15:0)" name="DRZ(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="NACK">
            <wire x2="2768" y1="1376" y2="1376" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1376" name="NACK" orien="R0" />
        <iomarker fontsize="28" x="2768" y="928" name="SCL" orien="R0" />
        <iomarker fontsize="28" x="2768" y="864" name="SDA" orien="R0" />
        <iomarker fontsize="28" x="992" y="1072" name="CLK" orien="R180" />
        <branch name="SCL">
            <wire x2="2768" y1="928" y2="928" x1="2736" />
        </branch>
        <branch name="SDA">
            <wire x2="2768" y1="864" y2="864" x1="2736" />
        </branch>
        <instance x="2272" y="1344" name="XLXI_2" orien="R0">
        </instance>
        <branch name="CLK">
            <wire x2="1120" y1="1072" y2="1072" x1="992" />
            <wire x2="1120" y1="1072" y2="1520" x1="1120" />
            <wire x2="2272" y1="1520" y2="1520" x1="1120" />
            <wire x2="1120" y1="944" y2="1072" x1="1120" />
            <wire x2="1200" y1="944" y2="944" x1="1120" />
            <wire x2="2272" y1="1376" y2="1520" x1="2272" />
        </branch>
        <branch name="RST">
            <wire x2="1104" y1="864" y2="864" x1="976" />
            <wire x2="1840" y1="720" y2="720" x1="1104" />
            <wire x2="1840" y1="720" y2="1312" x1="1840" />
            <wire x2="2272" y1="1312" y2="1312" x1="1840" />
            <wire x2="1104" y1="720" y2="832" x1="1104" />
            <wire x2="1104" y1="832" y2="864" x1="1104" />
            <wire x2="1200" y1="832" y2="832" x1="1104" />
        </branch>
        <iomarker fontsize="28" x="976" y="864" name="RST" orien="R180" />
        <branch name="XLXN_63(7:0)">
            <wire x2="1168" y1="1392" y2="1472" x1="1168" />
            <wire x2="2944" y1="1472" y2="1472" x1="1168" />
            <wire x2="1200" y1="1392" y2="1392" x1="1168" />
            <wire x2="2944" y1="1216" y2="1216" x1="2736" />
            <wire x2="2944" y1="1216" y2="1472" x1="2944" />
        </branch>
        <branch name="DRX(15:0)">
            <wire x2="1760" y1="1280" y2="1280" x1="1728" />
            <wire x2="1776" y1="1248" y2="1248" x1="1760" />
            <wire x2="1760" y1="1248" y2="1280" x1="1760" />
        </branch>
        <iomarker fontsize="28" x="1776" y="1248" name="DRX(15:0)" orien="R0" />
        <branch name="DRY(15:0)">
            <wire x2="1760" y1="1344" y2="1344" x1="1728" />
            <wire x2="1776" y1="1312" y2="1312" x1="1760" />
            <wire x2="1760" y1="1312" y2="1344" x1="1760" />
        </branch>
        <iomarker fontsize="28" x="1776" y="1312" name="DRY(15:0)" orien="R0" />
        <branch name="DRZ(15:0)">
            <wire x2="1760" y1="1408" y2="1408" x1="1728" />
            <wire x2="1776" y1="1376" y2="1376" x1="1760" />
            <wire x2="1760" y1="1376" y2="1408" x1="1760" />
        </branch>
        <iomarker fontsize="28" x="1776" y="1376" name="DRZ(15:0)" orien="R0" />
        <branch name="XLXN_70(7:0)">
            <wire x2="1792" y1="1152" y2="1152" x1="1728" />
            <wire x2="1984" y1="1104" y2="1104" x1="1792" />
            <wire x2="1984" y1="1104" y2="1216" x1="1984" />
            <wire x2="2272" y1="1216" y2="1216" x1="1984" />
            <wire x2="1792" y1="1104" y2="1152" x1="1792" />
        </branch>
        <branch name="XLXN_68(7:0)">
            <wire x2="1952" y1="1088" y2="1088" x1="1728" />
            <wire x2="1952" y1="928" y2="1088" x1="1952" />
            <wire x2="2272" y1="928" y2="928" x1="1952" />
        </branch>
        <branch name="XLXN_77">
            <wire x2="1968" y1="960" y2="960" x1="1728" />
            <wire x2="1968" y1="960" y2="1152" x1="1968" />
            <wire x2="2272" y1="1152" y2="1152" x1="1968" />
        </branch>
        <branch name="XLXN_78">
            <wire x2="2000" y1="896" y2="896" x1="1728" />
            <wire x2="2272" y1="848" y2="848" x1="2000" />
            <wire x2="2272" y1="848" y2="864" x1="2272" />
            <wire x2="2000" y1="848" y2="896" x1="2000" />
        </branch>
        <branch name="XLXN_80">
            <wire x2="1984" y1="832" y2="832" x1="1728" />
            <wire x2="1984" y1="832" y2="1088" x1="1984" />
            <wire x2="2272" y1="1088" y2="1088" x1="1984" />
        </branch>
        <branch name="XLXN_62">
            <wire x2="2752" y1="752" y2="752" x1="1152" />
            <wire x2="2752" y1="752" y2="1312" x1="2752" />
            <wire x2="1152" y1="752" y2="1056" x1="1152" />
            <wire x2="1200" y1="1056" y2="1056" x1="1152" />
            <wire x2="2752" y1="1312" y2="1312" x1="2736" />
        </branch>
        <instance x="1200" y="1440" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_117">
            <wire x2="1136" y1="656" y2="1168" x1="1136" />
            <wire x2="1200" y1="1168" y2="1168" x1="1136" />
            <wire x2="2960" y1="656" y2="656" x1="1136" />
            <wire x2="2960" y1="656" y2="1088" x1="2960" />
            <wire x2="2960" y1="1088" y2="1088" x1="2736" />
        </branch>
        <branch name="XLXN_119">
            <wire x2="1152" y1="1280" y2="1488" x1="1152" />
            <wire x2="2960" y1="1488" y2="1488" x1="1152" />
            <wire x2="1200" y1="1280" y2="1280" x1="1152" />
            <wire x2="2960" y1="1152" y2="1152" x1="2736" />
            <wire x2="2960" y1="1152" y2="1488" x1="2960" />
        </branch>
        <branch name="READ_Ready">
            <wire x2="1744" y1="1024" y2="1024" x1="1728" />
            <wire x2="1760" y1="1024" y2="1024" x1="1744" />
        </branch>
        <branch name="XLXN_67(3:0)">
            <wire x2="1744" y1="1216" y2="1216" x1="1728" />
            <wire x2="2256" y1="992" y2="992" x1="1744" />
            <wire x2="2272" y1="992" y2="992" x1="2256" />
            <wire x2="1744" y1="992" y2="1024" x1="1744" />
            <wire x2="1744" y1="1024" y2="1216" x1="1744" />
        </branch>
        <iomarker fontsize="28" x="1760" y="1024" name="READ_Ready" orien="R0" />
    </sheet>
</drawing>