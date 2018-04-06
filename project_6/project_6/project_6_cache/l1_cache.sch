<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_3(4:0)" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9(135:0)" />
        <blockdef name="L1_cache_block">
            <timestamp>2018-3-29T15:22:23</timestamp>
            <rect width="512" x="32" y="32" height="1344" />
            <line x2="32" y1="80" y2="80" style="linewidth:W" x1="0" />
            <line x2="32" y1="112" y2="112" style="linewidth:W" x1="0" />
            <line x2="32" y1="208" y2="208" style="linewidth:W" x1="0" />
            <line x2="32" y1="272" y2="272" x1="0" />
            <line x2="544" y1="80" y2="80" style="linewidth:W" x1="576" />
        </blockdef>
        <block symbolname="L1_cache_block" name="XLXI_1">
            <blockpin signalname="XLXN_3(4:0)" name="addra(4:0)" />
            <blockpin signalname="XLXN_9(135:0)" name="dina(135:0)" />
            <blockpin name="wea(0:0)" />
            <blockpin signalname="XLXN_8" name="clka" />
            <blockpin name="douta(135:0)" />
        </block>
        <block symbolname="L1_cache_block" name="XLXI_2">
            <blockpin signalname="XLXN_3(4:0)" name="addra(4:0)" />
            <blockpin signalname="XLXN_9(135:0)" name="dina(135:0)" />
            <blockpin name="wea(0:0)" />
            <blockpin signalname="XLXN_8" name="clka" />
            <blockpin name="douta(135:0)" />
        </block>
        <block symbolname="L1_cache_block" name="XLXI_4">
            <blockpin signalname="XLXN_3(4:0)" name="addra(4:0)" />
            <blockpin signalname="XLXN_9(135:0)" name="dina(135:0)" />
            <blockpin name="wea(0:0)" />
            <blockpin signalname="XLXN_8" name="clka" />
            <blockpin name="douta(135:0)" />
        </block>
        <block symbolname="L1_cache_block" name="XLXI_3">
            <blockpin signalname="XLXN_3(4:0)" name="addra(4:0)" />
            <blockpin signalname="XLXN_9(135:0)" name="dina(135:0)" />
            <blockpin name="wea(0:0)" />
            <blockpin signalname="XLXN_8" name="clka" />
            <blockpin name="douta(135:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="368" y="192" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1088" y="176" name="XLXI_2" orien="R0">
        </instance>
        <instance x="2592" y="176" name="XLXI_4" orien="R0">
        </instance>
        <branch name="XLXN_3(4:0)">
            <wire x2="368" y1="272" y2="272" x1="304" />
            <wire x2="304" y1="272" y2="1648" x1="304" />
            <wire x2="992" y1="1648" y2="1648" x1="304" />
            <wire x2="1728" y1="1648" y2="1648" x1="992" />
            <wire x2="1088" y1="256" y2="256" x1="992" />
            <wire x2="992" y1="256" y2="1536" x1="992" />
            <wire x2="992" y1="1536" y2="1648" x1="992" />
            <wire x2="1728" y1="192" y2="256" x1="1728" />
            <wire x2="1840" y1="256" y2="256" x1="1728" />
            <wire x2="1728" y1="256" y2="464" x1="1728" />
            <wire x2="1728" y1="464" y2="1648" x1="1728" />
            <wire x2="2480" y1="192" y2="192" x1="1728" />
            <wire x2="2480" y1="192" y2="256" x1="2480" />
            <wire x2="2592" y1="256" y2="256" x1="2480" />
        </branch>
        <instance x="1840" y="176" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_8">
            <wire x2="368" y1="464" y2="464" x1="320" />
            <wire x2="320" y1="464" y2="1632" x1="320" />
            <wire x2="1008" y1="1632" y2="1632" x1="320" />
            <wire x2="1008" y1="176" y2="448" x1="1008" />
            <wire x2="1008" y1="448" y2="1632" x1="1008" />
            <wire x2="1088" y1="448" y2="448" x1="1008" />
            <wire x2="1712" y1="176" y2="176" x1="1008" />
            <wire x2="1712" y1="176" y2="448" x1="1712" />
            <wire x2="1840" y1="448" y2="448" x1="1712" />
            <wire x2="2464" y1="176" y2="176" x1="1712" />
            <wire x2="2464" y1="176" y2="448" x1="2464" />
            <wire x2="2592" y1="448" y2="448" x1="2464" />
        </branch>
        <branch name="XLXN_9(135:0)">
            <wire x2="368" y1="304" y2="304" x1="288" />
            <wire x2="288" y1="304" y2="1584" x1="288" />
            <wire x2="976" y1="1584" y2="1584" x1="288" />
            <wire x2="976" y1="192" y2="288" x1="976" />
            <wire x2="976" y1="288" y2="1584" x1="976" />
            <wire x2="1088" y1="288" y2="288" x1="976" />
            <wire x2="1696" y1="192" y2="192" x1="976" />
            <wire x2="1696" y1="192" y2="288" x1="1696" />
            <wire x2="1840" y1="288" y2="288" x1="1696" />
            <wire x2="1696" y1="288" y2="1632" x1="1696" />
            <wire x2="2480" y1="1632" y2="1632" x1="1696" />
            <wire x2="2480" y1="288" y2="1632" x1="2480" />
            <wire x2="2592" y1="288" y2="288" x1="2480" />
        </branch>
    </sheet>
</drawing>