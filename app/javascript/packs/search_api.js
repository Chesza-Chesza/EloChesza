async function fetchPlayerData() {
<<<<<<< HEAD
    console.log('Fuera 1')
    const button = document.getElementById('top10')
    console.log(button)
    button.addEventListener('click', async function(){
        const data_raw = await fetch('/players?top10=true', {
        headers:  {
            "Content-Type": "application/javascript",
            "Accept": "application/javascript"
          }
        }
      )
        console.log('sal por favor')
    })
}
document.addEventListener('turbolinks:load', fetchPlayerData)
console.log('Fuera')
=======
    const data_raw = await fetch('https://fide-ratings.herokuapp.com/api/players')
    const data = await data_raw.json()


    data_parsed = JSON.parse(data)
    console.log(data_parsed['id_number'])

    const players = data_parsed['id_number']
    console.log("Players", players)

    const players_data = document.querySelector('#id_players')
    players_data.innerText = players
}
document.addEventListener('turbolinks:load', fetchPlayerData)
>>>>>>> main
