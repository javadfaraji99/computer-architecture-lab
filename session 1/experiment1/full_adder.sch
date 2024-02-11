<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="A" />
        <signal name="B" />
        <signal name="Cin" />
        <signal name="S" />
        <signal name="Cout" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="B" />
        <port polarity="Input" name="Cin" />
        <port polarity="Output" name="S" />
        <port polarity="Output" name="Cout" />
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_10" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="Cin" name="I0" />
            <blockpin signalname="XLXN_12" name="I1" />
            <blockpin signalname="XLXN_11" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_5">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_12" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_6">
            <blockpin signalname="Cin" name="I0" />
            <blockpin signalname="XLXN_12" name="I1" />
            <blockpin signalname="S" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_7">
            <blockpin signalname="XLXN_10" name="I0" />
            <blockpin signalname="XLXN_11" name="I1" />
            <blockpin signalname="Cout" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1520" y="752" name="XLXI_3" orien="R0" />
        <instance x="1440" y="368" name="XLXI_5" orien="R0" />
        <instance x="2048" y="400" name="XLXI_6" orien="R0" />
        <instance x="2464" y="784" name="XLXI_7" orien="R0" />
        <instance x="2016" y="640" name="XLXI_4" orien="R0" />
        <branch name="XLXN_10">
            <wire x2="2112" y1="656" y2="656" x1="1776" />
            <wire x2="2112" y1="656" y2="720" x1="2112" />
            <wire x2="2464" y1="720" y2="720" x1="2112" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="2368" y1="544" y2="544" x1="2272" />
            <wire x2="2368" y1="544" y2="656" x1="2368" />
            <wire x2="2464" y1="656" y2="656" x1="2368" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="1856" y1="272" y2="272" x1="1696" />
            <wire x2="1856" y1="272" y2="512" x1="1856" />
            <wire x2="2016" y1="512" y2="512" x1="1856" />
            <wire x2="2048" y1="272" y2="272" x1="1856" />
        </branch>
        <branch name="A">
            <wire x2="1440" y1="240" y2="240" x1="1408" />
        </branch>
        <iomarker fontsize="28" x="1408" y="240" name="A" orien="R180" />
        <branch name="B">
            <wire x2="1440" y1="304" y2="304" x1="1408" />
        </branch>
        <iomarker fontsize="28" x="1408" y="304" name="B" orien="R180" />
        <branch name="Cin">
            <wire x2="2016" y1="576" y2="576" x1="1984" />
        </branch>
        <iomarker fontsize="28" x="1984" y="576" name="Cin" orien="R180" />
        <branch name="A">
            <wire x2="1520" y1="624" y2="624" x1="1488" />
        </branch>
        <iomarker fontsize="28" x="1488" y="624" name="A" orien="R180" />
        <branch name="S">
            <wire x2="2336" y1="304" y2="304" x1="2304" />
        </branch>
        <iomarker fontsize="28" x="2336" y="304" name="S" orien="R0" />
        <branch name="Cout">
            <wire x2="2752" y1="688" y2="688" x1="2720" />
        </branch>
        <iomarker fontsize="28" x="2752" y="688" name="Cout" orien="R0" />
        <branch name="Cin">
            <wire x2="2048" y1="336" y2="336" x1="2016" />
        </branch>
        <iomarker fontsize="28" x="2016" y="336" name="Cin" orien="R180" />
        <branch name="B">
            <wire x2="1520" y1="688" y2="688" x1="1488" />
        </branch>
        <iomarker fontsize="28" x="1488" y="688" name="B" orien="R180" />
    </sheet>
</drawing>