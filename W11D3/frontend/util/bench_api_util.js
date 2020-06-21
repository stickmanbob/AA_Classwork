
export const getBenches = () => {
    return $.ajax({
            url: "/api/benches",
            method: "GET",
            error: (err) => console.log(err)
        })
};