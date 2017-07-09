class Contact

  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@contacts = []
  @@id       = 1
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note = 'N/A')
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id


    @@id += 1 # this way the next contact will get a different id
  end
  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
     @@contacts << new_contact
     return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
        return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
    if attribute == 'last_name'
      self.last_name = value
    elsif
      attribute == 'first_name'
      self.first_name = value
    elsif
      attribute == 'email'
      self.email = value
    elsif attribute == 'note'
      self.note = value

    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty

  def self.find_by(attribute, value)
    if attribute == "first_name"
      @@contacts.each do |contact|
        if contact.first_name == value
          return contact
        end
      end
    elsif attribute == "last_name"
      @@contacts.each do |contact|
        if contact.last_name == value
          return contact
        end
      end
    elsif attribute == "email"
      @@contacts.each do |contact|
        if contact.email == value
          return contact
        end
      end
    elsif attribute == "note"
      @@contacts.each do |contact|
        if contact.note == value
          return contact
        end
      end
    else
      return nil
    end
  end
end


  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
    puts @@contacts
  end

  def full_name
    return "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end


  # Feel free to add other methods here, if you need them.




a = Contact.create('jay', 'deverett', 'j@gmail.com', 'debater')
b = Contact.create('ben', 'smith', 'bs@gmail.com', 'dude')
c = Contact.create('alex', 'norris', 'an@gmail.com', 'wizard')
d = Contact.create('mike', 'rajf', 'mr@gmail.com', 'sup')

puts Contact.all.inspect
puts ""

puts Contact.find(2).inspect
puts ""

a.update("email", "jaydev@gmail.com")
puts a.inspect
puts ""

puts Contact.find_by('email', 'mr@gmail.com').inspect
puts ""

#c.delete #can only be used from instance



# puts b.full_name can only be called from instance


#
# Contact.delete_all WTF?
