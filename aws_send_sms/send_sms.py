import boto3
import argparse


def get_arguments():
    # create a variable to store the class of the parser object
    parser = argparse.ArgumentParser()
    # store the option values that the user can use and point it to the variable
    parser.add_argument("-n", "--number", dest="number", help="Mobile number ex: +xxxxxxxxxxxx")
    parser.add_argument("-m", "--message", dest="message", help="The message you want to send. If the message contains spaces insert the message between quotation marks")
    options = parser.parse_args()
    if not options.number:
        parser.error("\n[-] Please specify a mobile phone number, use --help for more info")
    elif not options.message:
        parser.error("\n[-] Please specify a message to send, use --help for more info")
    return options


def send_sms_function(number, message):
    # Create an SNS Client
    client = boto3.client(
        "sns",
        # Your user's aws access key
        aws_access_key_id="YOUR_ACCESS_KEY",
        # Your user's aws secret access key
        aws_secret_access_key="YOUR_SECRET_KEY",
        # The aws region where the account is located
        region_name="xx-xxxx-x"
    )
    # Send your sms message.
    print("\n[+] Will send your message to " + number)
    client.publish(
        PhoneNumber=(number),
        Message=(message)
    )

options = get_arguments()
send_sms = send_sms_function(options.number, options.message)
