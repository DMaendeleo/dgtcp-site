<script lang="ts">
    import Header from '$lib/layouts/dgtcp/Header.svelte';
    import Welcome from '$lib/layouts/dgtcp/Welcome.svelte';
    import MissionSection from "$lib/layouts/dgtcp/MissionSection.svelte";
    import ReportSection from "$lib/layouts/dgtcp/ReportSection.svelte";
    import News from "$lib/layouts/dgtcp/News.svelte";

    // import folder_icon_400 from "$lib/assets/dgtcp/folder-icon-400.jpg";
    import Footer from "$lib/layouts/dgtcp/Footer.svelte";

    // export let data
    // const { rapports } = data
    // console.log(rapports)

    const mmmm = [
        {
        id: 3,
        title: "Le Ministre des Finances Doudou Fwamba\n" +
            "Likunde Li-Botayi et le Group... ",
        description: "Likunde Li-Botayi et le Group Likunde Li-Botayi et le Group ... ",
        year: 2025,
        dateUploaded: "Sample one ",
        filename: "Sample one ",
        mimeType: "Sample one ",
        filesize: 23424,
        url: "Sample one ",
        createdAt: "Sample one ",
        updatedAt: "Sample one ",
    },  {
            id: 6,
            title: "Le Ministre des Finances Doudou Fwamba\n" +
                "Likunde Li-Botayi et le Group... ",
            description: "Likunde Li-Botayi et le Group Likunde Li-Botayi et le Group ... ",
            year: 2025,
            dateUploaded: "Sample one ",
            filename: "Sample one ",
            mimeType: "Sample one ",
            filesize: 23424,
            url: "Sample one ",
            createdAt: "Sample one ",
            updatedAt: "Sample one ",
        },
        {
            id: 7,
            title: "Le Ministre des Finances Doudou Fwamba\n" +
                "Likunde Li-Botayi et le Group... ",
            description: "Likunde Li-Botayi et le Group Likunde Li-Botayi et le Group ... ",
            year: 2025,
            dateUploaded: "Sample one ",
            filename: "Sample one ",
            mimeType: "Sample one ",
            filesize: 23424,
            url: "Sample one ",
            createdAt: "Sample one ",
            updatedAt: "Sample one ",
        },
        {
            id: 8,
            title: "Le Ministre des Finances Doudou Fwamba\n" +
                "Likunde Li-Botayi et le Group... ",
            description: "Likunde Li-Botayi et le Group Likunde Li-Botayi et le Group ... ",
            year: 2025,
            dateUploaded: "Sample one ",
            filename: "Sample one ",
            mimeType: "Sample one ",
            filesize: 23424,
            url: "Sample one ",
            createdAt: "Sample one ",
            updatedAt: "Sample one ",
        },
        {
            id: 9,
            title: "Le Ministre des Finances Doudou Fwamba\n" +
                "Likunde Li-Botayi et le Group... ",
            description: "Likunde Li-Botayi et le Group Likunde Li-Botayi et le Group ... ",
            year: 2025,
            dateUploaded: "Sample one ",
            filename: "Sample one ",
            mimeType: "Sample one ",
            filesize: 23424,
            url: "Sample one ",
            createdAt: "Sample one ",
            updatedAt: "Sample one ",
        }
    ]

</script>

<Header/>
<Welcome/>
<MissionSection
        logo="/images/dgtcp-logo.png"
        title={`Mission principale\nde la DGTCP`}
        description={`Mise en œuvre opérationnelle de la politique budgétaire en termes d'exécution des dépenses et de suivi des recettes perçues par les administrations financières`}
/>
<!--<ReportSection mReports={rapports.Rapports.docs} currentPage={1} totalPages={6} />-->
<ReportSection mReports={mmmm} currentPage={1} totalPages={6} />

<News />
<Footer />

