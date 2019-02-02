pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

import './poll.sol';

contract Generator {
  function generateProposal(string memory title, string memory details, uint32 closing_at) public returns (Poll) {
    Poll generated = new Poll(title, details, closing_at, 'pie');
    generated.addChoice('agree');
    generated.addChoice('abstain');
    generated.addChoice('disagree');
    generated.addChoice('block');
    generated.addOption('has_option_icons', 1);
    generated.addOption('must_have_options', 1);
    generated.addOption('require_stance_choices', 1);
    generated.addOption('single_choice', 1);
    generated.finalize();
    return generated;
  }

  function generateCount(string memory title, string memory details, uint32 closing_at) public returns (Poll) {
    Poll generated = new Poll(title, details, closing_at, 'progress');
    generated.addChoice('yes');
    generated.addChoice('no');
    generated.addOption('has_option_icons', 1);
    generated.addOption('must_have_options', 1);
    generated.addOption('require_stance_choices', 1);
    generated.addOption('single_choice', 1);
    generated.finalize();
    return generated;
  }

  function generatePoll(string memory title, string memory details, uint32 closing_at, string[15] memory choices, bool single_choice) public returns (Poll) {
    Poll generated = new Poll(title, details, closing_at, 'bar');
    for(uint8 i=0; i < choices.length; i++) {
      generated.addChoice(choices[i]);
    }
    generated.addOption('can_add_options', 1);
    generated.addOption('can_remove_options', 1);
    generated.addOption('must_have_options', 1);
    if (single_choice) {
      generated.addOption('single_choice', 1);
    }
    generated.finalize();
    return generated;
  }

  function generateDotVote(string memory title, string memory details, uint32 closing_at, string[15] memory choices, uint32 number_of_dots) public returns (Poll) {
    Poll generated = new Poll(title, details, closing_at, 'bar');
    for(uint8 i=0; i < choices.length; i++) {
      generated.addChoice(choices[i]);
    }
    generated.addOption('can_add_options', 1);
    generated.addOption('can_remove_options', 1);
    generated.addOption('must_have_options', 1);
    generated.addOption('number_of_dots', number_of_dots);
    generated.finalize();
    return generated;
  }

  function generateRankedChoice(string memory title, string memory details, uint32 closing_at, string[15] memory choices, uint32 minimum_stance_choices) public returns (Poll) {
    Poll generated = new Poll(title, details, closing_at, 'bar');
    for (uint8 i=0; i<choices.length; i++) {
      generated.addChoice(choices[i]);
    }
    generated.addOption('can_add_options', 1);
    generated.addOption('can_remove_options', 1);
    generated.addOption('must_have_options', 1);
    generated.addOption('require_stance_choices', 1);
    generated.addOption('has_variable_score', 1);
    generated.addOption('minimum_stance_choices', minimum_stance_choices);
    generated.finalize();
    return generated;
  }
}
