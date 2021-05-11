async function fetchPlayerData() {
    console.log('Fuera 1')
    const button = document.getElementById('top10')
    console.log(button)
    button.addEventListener('click', async function() {
        const data_raw = await fetch('/players?top10=true', {
            headers: {
                "Content-Type": "application/javascript",
                "Accept": "application/javascript"
            }
        })
        console.log('sal por favor')
    })
}
document.addEventListener('turbolinks:load', fetchPlayerData)
console.log('Fuera')