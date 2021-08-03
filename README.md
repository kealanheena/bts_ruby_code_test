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

There are 44 tests in totals and the test coverage is at 100.00%.

### Tests
