require 'rspec'

# Lab # 1

describe "My dogs name is anything" do
    it "verifies a match" do
        expect(myDog("My dog's name is \"\"")).to be true
    end
end

describe "My dogs name cant contain trailing or leading white space" do
    it "verifies white space fails" do
        expect(myDog(" My dog's name is \"\"")).to be false
    end
end

describe "My dog's name cant contain trailing white space" do
    it "verifies trailing white space fails" do
        expect(myDog("My dog's name is \"bob\" ")).to be false
    end
end

def myDog(input)
    if input =~ /^My dog's name is \"\w*\"$/
        return true
    else
        return false
    end
end

#Lab #2 A, B, C!

describe "Validates phone numbers" do
    it "validates U.S. phone numbers" do
        expect(validator("222-333-5555")).to eq true
    end
end

describe "Validates phone numbers" do
    it "should not validate 555-333-222" do
        expect(validator("5555-333-222")).to eq false
    end
end

describe "Validates U.S. Phone numbers" do
    it "should validate 411 and 911" do
        expect(validator("411")).to eq true
        expect(validator("911")).to eq true
    end
end

describe "Validates U.S. Phone Numbers" do
    it "should allow for spaces or dashes but not both" do
        expect(validator("111 222 3333")).to eq true
    end
end

describe "Validates U.S. Phone Numbers" do
    it "Should not allow just numbers" do
        expect(validator("1234567890")).to eq false
    end
end

describe "Validate" do
    it "Should not validate mixture of space and dash" do
        expect(validator("111-222 3333")).to eq false
    end
end

def validator(input)
    if input =~ /411|911|^\d{3}(-|\s)\d{3}\1\d{4}$/
        true
    else
        false
    end
end

#Lab #2 C!
describe "Validate international" do
    it "Should accept +1 134 911 1234" do
        expect(international("+1 134 911 1234")).to eq false
    end
end

describe "Validate internations area erc code 999 ok, 299 = bad" do
    it "should not validate 299" do
        expect(international("+1 298 123 4567")).to eq false
    end
end

describe "Validate international -> exchange codes x = xhange code +1 703 xxx nnnn" do
    it "Should not validate 0 or 1 leading number" do
        expect(international("+1 289 123 4567")).to eq false
    end
end

describe "Validate international -> exchange code x = exchange code +1 703 xxx nnnn" do
    it "Should not validate exchange codes which with the 2nd and third digit as 1" do
        expect(international("+1 289 311 4567")).to eq false
    end
end

def international(input)
    if input =~ /^\+1(-|\s)[2-9](99|[0-8]\d)\1[2-9]2-9]([0,2,3,4,5,6,7,8,9]1|1[0,2,3,4,5,6,7,8,9])\1\d{4}$/
        true
    else
        false
    end
end



