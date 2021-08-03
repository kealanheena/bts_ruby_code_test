# BTS Ruby Code Test

## Task

Your task is to create a program that can parse a single five card poker hand and rank
and label it according to the list of Poker Hands found further below.
Your program should prompt the user for a hand and respond with the corresponding
rank and name.
A poker hand is specified as a space separated list of five playing cards in which each
card has 2 characters indicating the face and suit. For example, 2D corresponds to the
2 of Diamonds.
The faces should be as follows:

| Values |     | Suits |
| ------ | --- | ----- |
| A      | 2   | H     |
| 3      | 4   | D     |
| 5      | 6   | C     |
| 7      | 8   | S     |
| 9      | 10  |       |
| J      | Q   |       |
| K      |     |

Your program should validate the hand is a valid poker hand and respond
appropriately. This should include, but is not limited to, valid cards, correct number of
cards and duplicate cards.

### Optional Task

This optional task is not required but feel free to attempt it. In addition to creating the
poker hand checking functionality you can create a web interface for it instead of a
command line interface in which the hand input is a form, and the results get returned
once submitted. To do so please use either Ruby on Rails or Sinatra. Additional styling
is not required.

### Input Output Table

| Input           | Output          |
| --------------- | --------------- |
| 2H 2D 2C KC QD  | Three of a Kind |
| 2H 5H 7D 8C 9S  | High Card       |
| AH 2D 3C 4C 5D  | Straight        |
| 2H 3H 2D 3C 3D  | Full House      |
| 2H 7H 2D 3C 3D  | Two Pair        |
| 2H 7H 7D 7C 7S  | Four of a Kind  |
| 10H JH QH KH AH | Straight Flush  |
| 4H 4S KS 5D 10S | One pair        |
| QC 10C 7C 6C QC | Invalid hand    |
| JH QH KH        | Invalid hand    |

### Coding Standards

- Use Git to version control the code
- Use a code formatter or linter
- Write Unit tests where applicable
- Include instructions in a README on how to run your application including the test suite

## Technologies

- Ruby on Rails
- Rspec (testing)
- Simplecov (test coverage)
- Rubocop (linter)
- Git/Github (source control)

## Getting Started

This programme is run on http://localhost:3000/ when run locally.

first open up you terminal and run the following commands:

```
$ git clone https://github.com/kealanheena/bts_ruby_code_test.git

$ cd bts_ruby_code_test
```

Then you need to install the gems with bundle install:

```
$ bundle install
```

and now you're ready to go run rails in you terminal and go to http://localhost:3000/ and start using the app.

```
$ rails s
```

There are more instuctions on the app page on how to use the form.

## Running Rubocop

After installing your gems run rubocop with the following command:

```
$ rubocop
```

There should be no offences.

## Running Tests

After installing your gems run rspec with the following command:

```
$ rspec
```

There are 43 tests in totals and the test coverage is at 100.00%.

## Tests

### Poker

<strong>initialize:</strong>

- should initialize with a hash of key value pairs for the card ranks

<strong>rank_hands:</trong>

- valid hands:

  - should return '1. straight flush' when straight flush is passed
  - should return '2. four of a kind' when four of a kind is passed
  - should return '3. full house' when full house is passed
  - should return '4. flush' when flush is passed
  - should return '5. straight' when straight is passed
  - should return '6. three of a kind' when three of a kind is passed
  - should return '7. two pair' when two pair is passed
  - should return '8. one pair' when one pair is passed
  - should return '9. high card' when straight flush is passed

- invalid hands
  - should return 'invalid hand: not enough cards
  - should return 'invalid hand: too many cards' when straight flush is passed
  - should return 'invalid hand: duplicate cards' when straight flush is passed
  - should return 'invalid hand: invalid cards' when straight flush is passed

### Hand

<strong>initialize:</strong>

- should initialize with a string and save that as an instance variable

<strong>identify:</strong>

- high card
  - should return 'high card' when 'AH KC 2D 10H 5S' is passed
  - should return 'high card' when 'AH KC 2C 10H 5S' is passed regardless of capitalization
- one pair
  - should return 'one pair' when 'AH AC 2D 10H 5S' is passed
  - should return 'one pair' when '10C AC 2D 10H 5S
- two pair
  - should return 'two pair' when '5H 2C 2D 10H 5S' is passed
  - should return 'two pair' when '10C AC AD 10H 5S' is passed
- three of a kind
  - should return 'three of a kind' when 'AH AC AD 10H 5S' is passed
  - should return 'three of a kind' when 'AH 5C 10D 10H 10S' is passed
- straight
  - should return 'straight' when 'QH 8C JH 10S 9C' is passed
  - should return 'straight' when '3H 7C 4H 6S 5C' is passed
- flush
  - should return 'flush' when '2H 5H AH 9H 10H' is passed
  - should return 'flush' when '2S 5S AS 9S 10S' is passed
- full house
  - should return 'full house' when 'AH AC 2D 2H 2S' is passed
  - should return 'full house' when '5H 5C 10D 10H 10S' is passed
- four of a kind
  - should return 'four of a kind' when 'AH AC AD 10H AS' is passed
  - should return 'four of a kind' when 'AH 10C 10D 10H 10S' is passed
- straight flush
  - should return 'straight flush' when '2H 3H 4H 5H 6H' is passed
  - should return 'straight flush' when '10S JS QS KS AS' is passed
