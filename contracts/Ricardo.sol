// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;


library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}





/* CONTRACT */
contract Ricardo{
using SafeMath for uint256;
/* VARIABLES */
string private _symbol;
string private _name;
uint8 private _decimals;
uint256 private _totalSupply;
address private _admin;
mapping(address => uint256) private _balanceOf;
mapping(address => mapping(address => uint256)) private _allowance;
/* CONSTRUCTOR */
constructor(){
    _symbol="RIC";
    _name="Ricardo";
    _decimals=0;
    _totalSupply=1000000;
    _admin=msg.sender;
    _balanceOf[msg.sender]=1000000;
}

/* TRANSFER EVENT */
event Transfer(address indexed _from, address indexed _to, uint256 _value);
/* APPROVAL EVENT */
event Approval(address indexed _owner, address indexed _spender, uint256 _value);

/* FUNCTION TO RETRIEVE THE NAME */
function name() public view returns (string memory){
return _name;
}
/* FUNCTION TO RETRIEVE SYMBOL */
function symbol() public view returns(string memory){
    return _symbol;
}
/* FUNCTION TO RETRIEVE DECIMALS */
function decimals() public view returns (uint8){
    return _decimals;
}
/* FUNCTION TO RETRIEVE totalSupply */
function totalSupply() public view returns (uint256){
    return _totalSupply;
}
/* FUNCTION TO RETRIEVE balanceOf */
function balanceOf(address _owner) public view returns (uint256 balance){
    return _balanceOf[_owner];
}
/* FUNCTION TO RETRIEVE OWNER */
function getOwner() external view returns (address){
    return _admin;
}
/* FUNCTION TO TRANSFER */
function transfer(address _to, uint256 _value) public returns (bool success){
    /* CHECK IF HE WAS ENOUGH TOKENS */
    require(_balanceOf[msg.sender] >= _value);
    /* TRANSFER ITSELF */
    _balanceOf[msg.sender] = _balanceOf[msg.sender].sub(_value);
    _balanceOf[_to] = _balanceOf[_to].add(_value);
    /* TRANSFER EVENT */
    emit Transfer(msg.sender,_to,_value);
    /* RETURN TRUE */
    return true;
}

function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
/* CHECK IF HE WAS ENOUGH TOKENS */
require(_balanceOf[_from] >= _value);
/* CHECK IF THE ALLOWANCE IS ENOUGHT */
require(_allowance[_from][_to]>=_value);
/* ESTABLISH THE NEW ALLOWANCE BALANCE */
_allowance[_from][_to]=_allowance[_from][_to].sub(_value);
/* MAKE THE TRANSFER */
_balanceOf[_from]=_balanceOf[_from].sub(_value);
_balanceOf[_to]=_balanceOf[_to].add(_value);
/* EMIT THE EVENT */
emit Transfer(_from, _to, _value);
/* RETURN TRUE */
return true;   
}
/* FUNCTION TO APPROVE THE ALLOWANCE */
function approve(address _spender, uint256 _value) public returns (bool success){
/* REQUIRE THAT HAS ENOUGH TOKENS */
require(_balanceOf[msg.sender]>=_value);
/* MAKE THE ALLOWANCE CAME TRUE */
_allowance[msg.sender][_spender]=_value;
/* RETURN TRUE */
return true;   
}
/* RETURN THE MUCH AN CERTAIN USER CAN ALLOW TO SPEND */
function allowance(address _owner, address _spender) public view returns (uint256 remaining){
return _allowance[_owner][_spender];
}

}