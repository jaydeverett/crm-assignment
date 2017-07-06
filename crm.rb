require_relative 'contact.rb'

class CRM

  def initialize(name)
    @name = name
    puts "Okay, this CRM has the name " + name
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then abort("Goodbye")
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp.downcase

    print 'Enter Last Name: '
    last_name = gets.chomp.downcase

    print 'Enter Email Address: '
    email = gets.chomp.downcase

    print 'Enter a Note: '
    note = gets.chomp.downcase

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "What category would you like to search by?"
    puts '[1] Last Name'
    puts '[2] First Name'
    puts '[3] E-Mail'
    puts '[4] Note'
    puts "Please enter a number"
    attribute = gets.chomp

    puts "Enter the name you are looking for"
    value = gets.chomp.downcase
    contact = Contact.find_by(attribute, value)

    puts "Enter first name, last name, email or note"
    attribute = gets.chomp.downcase

    puts "Enter a new value"
    value = gets.chomp.downcase

    contact.update(attribute, value)
  end

  def delete_contact
    delete(contact)
    @@contacts.delete(contact)
  end

  def display_all_contacts
    puts Contact.all
  end

  def search_by_attribute
    puts '[1] Last name'
    puts '[2] First name'
    puts '[3] Email'
    puts '[4] Note'
    print "Please select the number of the category you'd like to search"
    attribute = gets.chomp

    print "Please enter the value you'd like to search"
    value = gets.chomp.downcase

    puts Contact.find_by(attribute, value)
  end


end


my_crm = CRM.new("jay")
my_crm.main_menu
