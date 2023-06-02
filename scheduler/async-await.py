from asyncio import *

counter = 0

async def hello(word):          # async - указывает на то что функция может передать управление другой подпрограмме
    global counter

    while counter < 20:
        print("from " + word)

        if word == "A":
            await sleep (0.3)  # await - передаем управление на время длительной операции
        if word == "BB":
            await sleep (0.2)  # await - передаем управление на время длительной операции
        if word == "CCC":
            await sleep(0.1)  
        counter += 1

loop = get_event_loop()

loop.run_until_complete(
        gather(hello("A"), hello("BB"), hello("CCC")) # register in eventloop
)

loop.close()
