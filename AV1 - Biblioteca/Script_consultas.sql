-- Listar emprestimos realizados em 2023
SELECT * FROM Emprestimo
WHERE EXTRACT(YEAR FROM data_emprestimo) = 2023;

-- Listar o total de exemplares emprestados por aluno
SELECT id_aluno, COUNT(id_livro) AS total_emprestimos
FROM Emprestimo
GROUP BY id_aluno;

-- Listar dados dos livros cujo titulo inicia com a letra 'A'
SELECT * FROM Livro
WHERE titulo LIKE 'A%';

-- Calcular a media geral de multas (supondo uma tabela 'Multa')
SELECT AVG(valor) AS media_multa
FROM Multa;

-- Listar o total de emprestimos com multas superiores a 15 reais
SELECT id_emprestimo, COUNT(*) AS total_multas
FROM Emprestimo AS e
JOIN Multa AS m ON e.id_emprestimo = m.id_emprestimo
WHERE m.valor > 15
GROUP BY id_emprestimo;

-- Listar dados dos emprestimos em atraso
SELECT * FROM Emprestimo
WHERE data_prevista_devolucao < CURRENT_DATE AND data_devolucao IS NULL;