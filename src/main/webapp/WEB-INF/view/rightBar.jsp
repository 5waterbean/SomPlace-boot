<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>rightBar</title>
<style>
.right {
	width: 15%;
	position: fixed;
	top: 50px;
	right: 0;
	text-align: center;
	padding: 10px;
	margin: 10px;
}

.right>.create_btn {
	border: 1px solid black;
	background-color: rgb(226, 240, 217);
	padding: 5px;
	border-radius: 20px;
}

.right>.create_btn:hover {
	background-color: rgb(174, 220, 175);
	cursor: pointer;
}

.right .divTable {
	border: 1px solid black;
	border-radius: 20px;
}

.right table {
	border-collapse: collapse;
	width: 100%;
	border-radius: 20px;
}

.right table tr:nth-child(odd) {
	font-size: 5px;
	height: 20px;
}

.right table tr:nth-child(even) {
	border-top: 1px solid black;
}

.right table th {
	font-size: large;
}
</style>
</head>

<body>
	<div class="right">
		<div class="create_btn" onClick="location.href='/meeting/irregular/create/form';">모임 만들기</div>

		<br>

		<div class="divTable">
			<table>
				<tr>
					<th colspan="7">5월 일정</th>
				</tr>

				<tr>
					<td></td>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
				</tr>

				<tr>
					<td></td>
					<td>📌</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>


				<tr>
					<td>7</td>
					<td>8</td>
					<td>9</td>
					<td>10</td>
					<td>11</td>
					<td>12</td>
					<td>13</td>
				</tr>

				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>📌</td>
					<td></td>
				</tr>

				<tr>
					<td>14</td>
					<td>15</td>
					<td>16</td>
					<td>17</td>
					<td>18</td>
					<td>19</td>
					<td>20</td>
				</tr>

				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td>21</td>
					<td>22</td>
					<td>23</td>
					<td>24</td>
					<td>25</td>
					<td>26</td>
					<td>27</td>
				</tr>

				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>📌</td>
				</tr>

				<tr>
					<td>28</td>
					<td>29</td>
					<td>30</td>
					<td>31</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
</body>

</html>