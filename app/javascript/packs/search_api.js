async function fetchPlayerData() {
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