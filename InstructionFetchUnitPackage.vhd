library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

package InstructionFetchUnitPackage is
    
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
    
    component reg_32_ar is
        port (
            inWrite :  in std_logic_vector(31 downto 0);
            RegWr   :  in std_logic;
            Rst     :  in std_logic;
            arst    :  in std_logic;
            aload   :  in std_logic_vector(31 downto 0);
            clk     :  in std_logic;
            Q       : out std_logic_vector(31 downto 0)
        );
    end component reg_32_ar;
end;