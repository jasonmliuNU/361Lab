library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity InstructionFetchUnitTest is
end InstructionFetchUnitTest;

architecture behavioral of InstructionFetchUnitTest is
    signal clk: std_logic := '0';
    signal arst: std_logic;
    signal Branch: std_logic_vector(1 downto 0);
    signal Zero: std_logic;
    signal Sign: std_logic;
    signal Instruction: std_logic_vector(31 downto 0);
    component InstructionFetchUnit is
        port(
            clk: in std_logic;
            arst: in std_logic; -- resets the PC to 0x00400020
            Branch: in std_logic_vector(1 downto 0);
            Zero: in std_logic;
            Sign: in std_logic;
            Instruction: out std_logic_vector(31 downto 0);
            InFile: string
        );
    end component InstructionFetchUnit;
    begin
    testcomp: InstructionFetchUnit
    port map(clk,arst,Branch,Zero,Sign,Instruction,"bills_branch.dat");
    testbench: process
    begin
       arst <= '1';
       wait for 3 ns;
       arst <= '0';
       Branch <= "00";
       Zero <= '0';
       Sign <= '0';
    end process;
    clk_process: process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;
    
end architecture;
