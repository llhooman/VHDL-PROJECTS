library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity carry_ripple_adder is
    port(
        x : inout STD_LOGIC_VECTOR(15 downto 0):="0000010111000001";
        y : inout STD_LOGIC_VECTOR(15 downto 0):="0001111110000101";
        s : out   STD_LOGIC_VECTOR(15 downto 0)
    );
end entity carry_ripple_adder;

architecture rtl of carry_ripple_adder is
    component full_adder is
        port
        (
            A    : IN STD_LOGIC ;
            B    : IN STD_LOGIC ;
            Cin  : IN STD_LOGIC ;
            S    : OUT STD_LOGIC ;
            Cout : OUT STD_LOGIC
        );
    end component;
    signal cout : STD_LOGIC_VECTOR(15 downto 0);
begin
    
    fa00: full_adder port map(A=>x(0),B=>y(0),Cin=>'0',S=>s(0),Cout=>cout(0));
    fa01: full_adder port map(A=>x(1),B=>y(1),Cin=>cout(0),S=>s(1),Cout=>cout(1));
    fa02: full_adder port map(A=>x(2),B=>y(2),Cin=>cout(1),S=>s(2),Cout=>cout(2));
    fa03: full_adder port map(A=>x(3),B=>y(3),Cin=>cout(2),S=>s(3),Cout=>cout(3));
    fa04: full_adder port map(A=>x(4),B=>y(4),Cin=>cout(3),S=>s(4),Cout=>cout(4));
    fa05: full_adder port map(A=>x(5),B=>y(5),Cin=>cout(4),S=>s(5),Cout=>cout(5));
    fa06: full_adder port map(A=>x(6),B=>y(6),Cin=>cout(5),S=>s(6),Cout=>cout(6));
    fa07: full_adder port map(A=>x(7),B=>y(7),Cin=>cout(6),S=>s(7),Cout=>cout(7));
    fa08: full_adder port map(A=>x(8),B=>y(8),Cin=>cout(7),S=>s(8),Cout=>cout(8));
    fa09: full_adder port map(A=>x(9),B=>y(9),Cin=>cout(8),S=>s(9),Cout=>cout(9));
    fa10: full_adder port map(A=>x(10),B=>y(10),Cin=>cout(9),S=>s(10),Cout=>cout(10));
    fa11: full_adder port map(A=>x(11),B=>y(11),Cin=>cout(10),S=>s(11),Cout=>cout(11));
    fa12: full_adder port map(A=>x(12),B=>y(12),Cin=>cout(11),S=>s(12),Cout=>cout(12));
    fa13: full_adder port map(A=>x(13),B=>y(13),Cin=>cout(12),S=>s(13),Cout=>cout(13));
    fa14: full_adder port map(A=>x(14),B=>y(14),Cin=>cout(13),S=>s(14),Cout=>cout(14));
    fa15: full_adder port map(A=>x(15),B=>y(15),Cin=>cout(14),S=>s(15),Cout=>cout(15));
    
end architecture rtl;