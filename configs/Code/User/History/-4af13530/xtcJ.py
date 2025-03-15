
def deal_cards(AC,num,nop):
    Pd = []
    deck = list(AC)
    random.shuffle(deck)
    for i in range(0, nop):
        Pd.append(deck[i:i+num*nop:nop])
    deck = deck[num*nop:]
    return Pd, deck

