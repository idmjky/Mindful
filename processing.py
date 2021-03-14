def do_calculation(text):
    text=text.split(" ")
    length=len(text)
    extreme=0
    regular=0
    for words in text:
        if words=="suicide" or words=="useless" or words=="nightmare" or words=="depress" or words=="helpless" or words=="meaningless" or words=="impossible" or words=="dying" or words=="torture" or words=="torment" or words=="hopeless" or words=="worthless" or words=="despair" or words=="desperate" or words=="pathetic"or words=="hate" or words=="die" or words=="trapped" or words=="dead" or words=="kill":
            extreme=extreme+1
        if words =="anxiety" or words =="panic" or words =="drained" or words =="sad" or words =="guilt" or words=="guilty" or words=="insecure" or words=="unsure" or words=="hurt" or words=="stupid" or words=="dumb" or words=="lost" or words=="afraid" or words=="frighten" or words=="fault" or words=="calm" or words=="symptom" or words=="panic" or words=="attack" or words=="fade" or words=="stress" or words=="anxious" or words=="bad" or words=="worse" or words=="never" or words=="nobody" or words=="annoy" or words=="annoyed" or words=="disgusting" or words=="disgusted" or words=="nothing" or words=="none" or words=="lone" or words=="agonize" or words =="agonized" or words=="agonizing" or words=="pain" or words=="painful" or words =="upset" or words=="difficult" or words=="hard" or words =="fear" or words=="hard" or words=="tired" or words=="tiring" or words=="exhausting" or words=="exhausted" or words=="hide" or words=="alive" or words=="mess" or words=="messed" or words=="couldn't" or words=="can't" or words=="cannot":
            regular=regular+1
    if (regular/length)>0.1:
        return "If possible, get some more rest and talk to your friends and loved ones. You seem to be a bit upset, but that's okay and perfectly normal. Everybody experiences a down day or two once in a while. What matters most is that you maintain a positive outlook and have faith that one day, in retrospect, these days will merely be transient episodes in your much more colorful story of life."
    elif extreme>0:
        return "You seem to be having strongly negative thoughts that cannot cease to linger in your mind, disturbing you day and night. It might be time to pause for a moment and think about reaching out to someone, either trustworthy or professional, who can help you with your situation. It is recommended that you do this as soon as possible. Please try to have more faith in yourself and others."
    else:
        return "Being positive isn't pretending everything is good; it is seeing the good in everything"
