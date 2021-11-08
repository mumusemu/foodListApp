import axios from "axios";
import { useEffect, useState } from "react";
import { Link, useHistory } from "react-router-dom";
import { DateTime } from 'luxon';

function Home() {
  const [listOfFoods, setListOfFoods] = useState([]);
  console.log (11, listOfFoods['rows']);
  let history = useHistory();

  useEffect(() => {
    if (!localStorage.getItem("accessToken")) {
      history.push("/login");
    } else {
      axios
        .get("http://localhost:3001/foods", {
          headers: { accessToken: localStorage.getItem("accessToken") },
        })
        .then((response) => {
          setListOfFoods(response.data.listOfFoods.rows);
        });
    }
  }, []);

  return (
    <div>
      {listOfFoods.map((value, key) => {
        return (
          <div key={key} className="post">
            <div className="title"> {value.title} </div>
            <div
              className="body"
              onClick={() => {
                history.push(`/post/${value.id}`);
              }}
            >
              {value.foodText}
            </div>
            <div className="footer">
              <div className="username">
                <Link to={`/profile/${value.UserId}`}> {value.username} </Link>
              </div>
              <div className="buttons">
                <Link to={`/profile/${value.createdAt}`}> {DateTime.fromISO(value.createdAt).toUTC().toFormat('yyyy-MM-dd HH:mm:ss')} </Link>
              </div>
            </div>
          </div>
        );
      })}
    </div>
  );
}

export default Home;
