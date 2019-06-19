pragma solidity ^0.5.4;

contract Precompile {

    function fourtyTwo() public view returns (string memory) {
        return "fourtyTwo";
    }

    function callFourtyTwo1() public {
        fourtyTwo();
    }

    function callFourtyTwo2() public {
        fourtyTwo();
        fourtyTwo();
    }

    function precompiledExpmod(uint256 base, uint256 exponent, uint256 p) public view returns (uint256) {
        uint256[1] memory output;
        // 256 bits / 8 = 32 bytes
        uint256[6] memory args = [32, 32, 32, base, exponent, p]; //32 * 6 = 192 -> input size

        assembly {
            // staticcall(gas, at_addr, args, input size, output, output size)
            // staticcall(gas, at_addr, args, 192 bytes, output, 32 bytes)
            if iszero(staticcall(not(0), 0x05, args, 0xc0, output, 0x20)) {
                revert(0, 0)
            }
        }
        return output[0];
    }

    function callExpmod1() public {
        precompiledExpmod(5, 3, 13);
    }

    function callExpmod2() public {
        precompiledExpmod(5, 3, 13);
        precompiledExpmod(5, 3, 13);
    }

    function expmod(uint256 base, uint256 exponent, uint256 p) public returns (uint256) {
        uint256[1] memory output;
        uint256[6] memory args = [32, 32, 32, base, exponent, p];

        assembly {
            if iszero(staticcall(not(0), 0x05, args, 0xc0, output, 0x20)) {
                revert(0, 0)
            }
        }
        return output[0];
    }

    function expmod1(uint256 base, uint256 exponent, uint256 p) public returns (uint256) {
        assembly {
            // define pointer
            // let p := mload(0x40)
            // // store data assembly-favouring ways
            // mstore(p, 0x20)             // Length of Base
            // mstore(add(p, 0x20), 0x20)  // Length of Exponent
            // mstore(add(p, 0x40), 0x20)  // Length of Modulus
            // mstore(add(p, 0x60), base)  // Base
            // mstore(add(p, 0x80), e)     // Exponent
            // mstore(add(p, 0xa0), m)     // Modulus
            // // call modexp precompile! -- old school gas handling
            // let success := call(sub(gas, 2000), 0x05, 0, p, 0xc0, p, 0x20)
            // // gas fiddling
            // switch success case 0 {
            //     revert(0, 0)
            // }
            // // data
            // o := mload(p)
        }
    }

    function my_sha256(bytes memory input) public returns (uint256 o) {
        uint256[1] memory output;

        assembly {
            if iszero(staticcall(not(0), 0x02, input, 0xc0, output, 0x40)) {
                revert(0, 0)
            }
        }

        return output[0];
    }
}
