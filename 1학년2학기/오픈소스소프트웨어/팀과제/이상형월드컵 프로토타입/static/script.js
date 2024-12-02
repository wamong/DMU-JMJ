document.getElementById('start-button').addEventListener('click', function() {
    fetch('/start-worldcup')
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                alert('이상형 월드컵이 시작되었습니다!');
            } else {
                alert('오류가 발생했습니다.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
});
