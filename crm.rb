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

    contact = Contact.create(
      first_name: first_name,
      last_name:  last_name,
      email:      email,
      note:       note
    )
  end

  def modify_existing_contact
    print "Whose contact would you like to modify?"
    print "Please enter their first name: "
    name = gets.chomp.downcase

    print "Which attribute would you like to change?"
    attribute = gets.chomp.downcase

    print "What would you like to change it to?"
    value = gets.chomp.downcase

    contacts = Contact.find_by(
    first_name: name
    ).update(attribute => value)
  end

  def delete_contact
    delete(contact)
    @@contacts.delete(contact)

    # print "Enter id of contct to delete: "
    # id = gets.to_i
    # contact = Contact.find(id)
    # contact.delete
  end

  def display_all_contacts
    puts Contact.all.inspect
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

    puts Contact.find_by(attribute, value).inspect
  end


end


my_crm = CRM.new("jay")
my_crm.main_menu

at_exit do
  ActiveRecord::Base.connection.close
end
