import React, { useEffect, useState, useContext } from "react";
import { useParams, useHistory } from "react-router-dom";
import axios from "axios";
import { AuthContext } from "../helpers/AuthContext";

function Profile() {
  let { id } = useParams();
  let history = useHistory();
  const [username, setUsername] = useState("");
  const [listOfFoods, setListOfFoods] = useState([]);
  const { authState } = useContext(AuthContext);

  useEffect(() => {
    axios.get(`http://localhost:3001/auth/basicinfo/${id}`).then((response) => {
      setUsername(response.data.username);
    });

    axios.get(`http://localhost:3001/foods/byuserId/${id}`).then((response) => {
      setListOfFoods(response.data);
    });
  }, []);

  return (
    <div className="profilePageContainer">
      <div className="basicInfo">
        {" "}
        <h1> Username: {username} </h1>
        {authState.username === username && (
          <button
            onClick={() => {
              history.push("/changepassword");
            }}
          >
            {" "}
            Change My Password
          </button>
        )}
      </div>
      <div className="listOfFoods">
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
                <div className="username">{value.username}</div>
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}

export default Profile;
