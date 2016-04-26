require 'openssl'

print "Enter file name: "
input_file = gets.chomp

#encryption
cipher = OpenSSL::Cipher::AES.new(128, :CBC)
cipher.encrypt
key = cipher.random_key
iv = cipher.random_iv

buffer = ""
File.open(input_file, "rb") do |infile|
  File.open("encrypted_file.json", "wb") do |outfile|
    while buffer = infile.read(4096)
      outfile << cipher.update(buffer)
    end
    outfile << cipher.final
  end
end

puts "Encryption successfull"

#decryption
decipher = OpenSSL::Cipher::AES.new(128, :CBC)
decipher.decrypt
decipher.key = key
decipher.iv = iv

buffer = ""
File.open("encrypted_file.json", "rb") do |infile|
  File.open("decrypted_file.json", "wb") do |outfile|
    while buffer = infile.read(4096)
      outfile << decipher.update(buffer)
    end
    outfile << decipher.final
  end
end

puts "Decryption successfull"