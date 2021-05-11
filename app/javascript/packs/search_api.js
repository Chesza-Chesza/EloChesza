async function fetchPlayerData() {
    const data_raw = await fetch("https://lichess.org/streamer/live")
    const data = await data_raw.json()


    data_parsed = JSON.parse(data)
    console.log(data_parsed['id_number'])

    const players = data_parsed['id_number']
    console.log("Players", players)

    const players_data = document.querySelector('#name_id')
    players_data.innerText = players
}
document.addEventListener('turbolinks:load', fetchPlayerData)