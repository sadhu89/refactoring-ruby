require './customer'
require './movie'
require './rental'
require 'test/unit'

class VideoRentalTest < Test::Unit::TestCase
  def test_statement
    customer = Customer.new('Chap')
    movie1 = Movie.new('Joe Versus the Volcano', Movie::REGULAR)
    rental1 = Rental.new(movie1, 5)
    customer.add_rental(rental1)

    assert_equal "Rental Record for Chap\n" \
                 "\tJoe Versus the Volcano\t6.5\n"   \
                 "Amount owed is 6.5\n"              \
                 'You earned 1 frequent renter points', customer.statement

    movie2 = Movie.new('Sleepless in Seattle', Movie::CHILDRENS)
    rental2 = Rental.new(movie2, 1)
    customer.add_rental(rental2)

    assert_equal "Rental Record for Chap\n" \
                 "\tJoe Versus the Volcano\t6.5\n"   \
                 "\tSleepless in Seattle\t1.5\n"     \
                 "Amount owed is 8.0\n"              \
                 'You earned 2 frequent renter points', customer.statement

    movie3 = Movie.new('You\'ve Got Mail', Movie::NEW_RELEASE)
    rental3 = Rental.new(movie3, 15)
    customer.add_rental(rental3)

    assert_equal "Rental Record for Chap\n" \
                 "\tJoe Versus the Volcano\t6.5\n"   \
                 "\tSleepless in Seattle\t1.5\n"     \
                 "\tYou've Got Mail\t45\n"           \
                 "Amount owed is 53.0\n"             \
                 'You earned 4 frequent renter points', customer.statement
  end
end
