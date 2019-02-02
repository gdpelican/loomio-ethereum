pragma solidity ^0.5.0;

contract Poll {
  struct Details {
    address author;
    string  title;
    string  description;
    uint32  closing_at;
    string  chart_type;
  }
  struct Choice {
    address author;
    string  name;
    uint32  index;
  }
  struct Stance {
    string statement;
    mapping (uint32 => uint32) choices;
  }
  struct Outcome {
    address author;
    string  statement;
  }

  Details  details;
  Choice[] choices;
  Outcome  outcome;

  uint8 choiceIndex = 0;

  mapping (address => Stance) stances;
  mapping (string => uint32)  options;

  constructor(string memory _title, string memory _description, uint32 _closing_at, string memory _chart_type) public {
    details = Details(msg.sender, _title, _description, _closing_at, _chart_type);
  }

  function addChoice(string memory _name) public {
    require(!isFinalized() || options['can_add_options'] > 0);

    choices.push(Choice(msg.sender, _name, choiceIndex++));
  }

  function addOption(string memory _field, uint32 _value) public {
    require (!isFinalized());

    options[_field] = _value;
  }

  function finalize() public {
    require (!isFinalized());

    addOption('finalized', 1);
  }

  function isFinalized() public view returns (bool) {
    return options['finalized'] > 0;
  }

  function createStance(string memory _statement, uint8[] memory _indices, uint32[] memory _values) public {
    require (isFinalized());

    stances[msg.sender] = Stance(_statement);
    for (uint8 i=0; i < _indices.length; i++) {
        stances[msg.sender].choices[_indices[i]] = _values[i];
    }
  }
}
