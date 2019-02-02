import React, { Component } from 'react'
import { generator } from './contracts'

class App extends Component {
  createContract(pollType, options) {
    switch(pollType) {
      case 'proposal':
        loomioContract.generateProposal(
          options.title,
          options.description,
          options.closing_at
        )
        break
      case 'check':
        loomioContract.generateCheck(
          options.title,
          options.description,
          options.closing_at
        )
        break
      case 'poll':
        loomioContract.generatePoll(
          options.title,
          options.description,
          options.closing_at,
          options.choices,
          options.single_choice
        )
        break
      case 'dot_vote':
        loomioContract.generateDotVote(
          options.title,
          options.description,
          options.closing_at,
          options.choices,
          options.number_of_dots
        )
        break
      case 'ranked_choice':
        loomioContract.generateRankedChoice(
          options.title,
          options.description,
          options.closing_at,
          options.choices,
          options.minimum_stance_choices
        )
        break
    }
  }
}
