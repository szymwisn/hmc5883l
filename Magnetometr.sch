<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1(7:0)" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5(7:0)" />
        <signal name="RST" />
        <signal name="CLK" />
        <signal name="SDA" />
        <signal name="SCL" />
        <signal name="XLXN_13">
        </signal>
        <signal name="FIFO_Full" />
        <signal name="NACK" />
        <signal name="XLXN_6(3:0)" />
        <signal name="XLXN_32(7:0)" />
        <signal name="XLXN_33" />
        <signal name="XLXN_39" />
        <signal name="XLXN_40" />
        <signal name="XLXN_41(7:0)" />
        <port polarity="Input" name="RST" />
        <port polarity="Input" name="CLK" />
        <port polarity="BiDirectional" name="SDA" />
        <port polarity="BiDirectional" name="SCL" />
        <port polarity="Output" name="FIFO_Full" />
        <port polarity="Output" name="NACK" />
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
            <timestamp>2020-3-24T22:6:32</timestamp>
            <rect width="400" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <line x2="0" y1="-112" y2="-112" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="528" y1="-352" y2="-352" x1="464" />
            <line x2="528" y1="-288" y2="-288" x1="464" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <rect width="64" x="464" y="-172" height="24" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <rect width="64" x="464" y="-108" height="24" />
            <line x2="528" y1="-96" y2="-96" x1="464" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
        </blockdef>
        <block symbolname="I2C_Master" name="XLXI_2">
            <blockpin signalname="XLXN_4" name="Go" />
            <blockpin signalname="XLXN_1(7:0)" name="Address(7:0)" />
            <blockpin signalname="XLXN_6(3:0)" name="ReadCnt(3:0)" />
            <blockpin signalname="SDA" name="SDA" />
            <blockpin signalname="SCL" name="SCL" />
            <blockpin signalname="XLXN_3" name="FIFO_Pop" />
            <blockpin signalname="XLXN_2" name="FIFO_Push" />
            <blockpin signalname="XLXN_32(7:0)" name="FIFO_DI(7:0)" />
            <blockpin signalname="XLXN_13" name="FIFO_Empty" />
            <blockpin signalname="FIFO_Full" name="FIFO_Full" />
            <blockpin signalname="XLXN_41(7:0)" name="FIFO_DO(7:0)" />
            <blockpin signalname="RST" name="Reset" />
            <blockpin signalname="CLK" name="Clk" />
            <blockpin signalname="XLXN_40" name="Busy" />
            <blockpin signalname="NACK" name="NACK" />
        </block>
        <block symbolname="HMC5883L_read" name="XLXI_3">
            <blockpin signalname="RST" name="RST" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="XLXN_40" name="I2C_Busy" />
            <blockpin signalname="XLXN_13" name="I2C_FIFO_Empty" />
            <blockpin signalname="XLXN_41(7:0)" name="I2C_FIFO_DO(7:0)" />
            <blockpin signalname="XLXN_3" name="I2C_FIFO_Pop" />
            <blockpin signalname="XLXN_4" name="I2C_Go" />
            <blockpin signalname="XLXN_2" name="I2C_FIFO_Push" />
            <blockpin signalname="XLXN_1(7:0)" name="I2C_Address(7:0)" />
            <blockpin signalname="XLXN_32(7:0)" name="I2C_FIFO_DI(7:0)" />
            <blockpin signalname="XLXN_6(3:0)" name="I2C_ReadCnt(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="RST">
            <wire x2="1104" y1="976" y2="976" x1="992" />
            <wire x2="1248" y1="976" y2="976" x1="1104" />
            <wire x2="1840" y1="880" y2="880" x1="1104" />
            <wire x2="1840" y1="880" y2="1312" x1="1840" />
            <wire x2="2272" y1="1312" y2="1312" x1="1840" />
            <wire x2="1104" y1="880" y2="960" x1="1104" />
            <wire x2="1104" y1="960" y2="976" x1="1104" />
        </branch>
        <branch name="SDA">
            <wire x2="2768" y1="864" y2="864" x1="2736" />
        </branch>
        <branch name="SCL">
            <wire x2="2768" y1="928" y2="928" x1="2736" />
        </branch>
        <branch name="XLXN_13">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2768" y="1088" type="branch" />
            <wire x2="1248" y1="1216" y2="1216" x1="1184" />
            <wire x2="1184" y1="1216" y2="1472" x1="1184" />
            <wire x2="3008" y1="1472" y2="1472" x1="1184" />
            <wire x2="2768" y1="1088" y2="1088" x1="2736" />
            <wire x2="3008" y1="1088" y2="1088" x1="2768" />
            <wire x2="3008" y1="1088" y2="1472" x1="3008" />
        </branch>
        <branch name="FIFO_Full">
            <wire x2="2768" y1="1152" y2="1152" x1="2736" />
        </branch>
        <branch name="NACK">
            <wire x2="2768" y1="1376" y2="1376" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="992" y="976" name="RST" orien="R180" />
        <iomarker fontsize="28" x="992" y="1072" name="CLK" orien="R180" />
        <branch name="CLK">
            <wire x2="1008" y1="1072" y2="1072" x1="992" />
            <wire x2="1072" y1="1072" y2="1072" x1="1008" />
            <wire x2="1104" y1="1072" y2="1072" x1="1072" />
            <wire x2="1232" y1="1072" y2="1072" x1="1104" />
            <wire x2="1104" y1="1072" y2="1376" x1="1104" />
            <wire x2="2272" y1="1376" y2="1376" x1="1104" />
            <wire x2="1232" y1="1056" y2="1072" x1="1232" />
            <wire x2="1248" y1="1056" y2="1056" x1="1232" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1376" name="NACK" orien="R0" />
        <iomarker fontsize="28" x="2768" y="1152" name="FIFO_Full" orien="R0" />
        <iomarker fontsize="28" x="2768" y="928" name="SCL" orien="R0" />
        <iomarker fontsize="28" x="2768" y="864" name="SDA" orien="R0" />
        <instance x="2272" y="1344" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_32(7:0)">
            <wire x2="2016" y1="1232" y2="1232" x1="1776" />
            <wire x2="2256" y1="1216" y2="1216" x1="2016" />
            <wire x2="2272" y1="1216" y2="1216" x1="2256" />
            <wire x2="2016" y1="1216" y2="1232" x1="2016" />
        </branch>
        <branch name="XLXN_6(3:0)">
            <wire x2="1968" y1="1296" y2="1296" x1="1776" />
            <wire x2="2256" y1="992" y2="992" x1="1968" />
            <wire x2="2272" y1="992" y2="992" x1="2256" />
            <wire x2="1968" y1="992" y2="1296" x1="1968" />
        </branch>
        <branch name="XLXN_1(7:0)">
            <wire x2="2016" y1="1168" y2="1168" x1="1776" />
            <wire x2="2256" y1="928" y2="928" x1="2016" />
            <wire x2="2272" y1="928" y2="928" x1="2256" />
            <wire x2="2016" y1="928" y2="1168" x1="2016" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="2000" y1="1104" y2="1104" x1="1776" />
            <wire x2="2000" y1="1104" y2="1152" x1="2000" />
            <wire x2="2256" y1="1152" y2="1152" x1="2000" />
            <wire x2="2272" y1="1152" y2="1152" x1="2256" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1984" y1="1040" y2="1040" x1="1776" />
            <wire x2="2256" y1="864" y2="864" x1="1984" />
            <wire x2="2272" y1="864" y2="864" x1="2256" />
            <wire x2="1984" y1="864" y2="1040" x1="1984" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="2000" y1="976" y2="976" x1="1776" />
            <wire x2="2000" y1="976" y2="1088" x1="2000" />
            <wire x2="2256" y1="1088" y2="1088" x1="2000" />
            <wire x2="2272" y1="1088" y2="1088" x1="2256" />
        </branch>
        <instance x="1248" y="1328" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_40">
            <wire x2="1168" y1="752" y2="1136" x1="1168" />
            <wire x2="1248" y1="1136" y2="1136" x1="1168" />
            <wire x2="2752" y1="752" y2="752" x1="1168" />
            <wire x2="2752" y1="752" y2="1312" x1="2752" />
            <wire x2="2752" y1="1312" y2="1312" x1="2736" />
        </branch>
        <branch name="XLXN_41(7:0)">
            <wire x2="1216" y1="768" y2="1296" x1="1216" />
            <wire x2="1248" y1="1296" y2="1296" x1="1216" />
            <wire x2="2992" y1="768" y2="768" x1="1216" />
            <wire x2="2992" y1="768" y2="1216" x1="2992" />
            <wire x2="2992" y1="1216" y2="1216" x1="2736" />
        </branch>
    </sheet>
</drawing>