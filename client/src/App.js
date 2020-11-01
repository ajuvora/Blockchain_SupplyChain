import React from 'react';
import Supplychain from './artifacts/Supplychain.json'
import {DrizzleProvider} from 'drizzle-react'
import { LoadingContainer , AccountData, ContractData, ContractForm} from 'drizzle-react-components'

const drizzleOptions = {
  contracts: [Supplychain]
}

function App() { // class App extends Component { render(){return <></>} }

  // function someFunc(props) {
  //   console.log(props);
  //   return (
  //     <form
  //       className="pure-form pure-form-stacked"
  //       onSubmit={props.handleSubmit}
  //     >
  //       {props.inputs.map((input, index) => {
  //         var inputType = input.type; // translateType(input.type);
  //         var inputLabel = props.labels
  //           ? props.labels[index]
  //           : input.name;
  //         // check if input type is struct and if so loop out struct fields as well
  //         return (
  //           <input
  //             key={input.name}
  //             type={inputType}
  //             name={input.name}
  //             value={props.state[input.name]}
  //             placeholder={inputLabel}
  //             onChange={props.handleInputChange}
  //             className="did-it-work"
  //           />
  //         );
  //       })}
  //       <button
  //         key="submit"
  //         className="pure-button"
  //         type="button"
  //         onClick={props.handleSubmit}
  //       >
  //         Submit
  //       </button>
  //     </form>)
  // }
  return (
    <DrizzleProvider options={drizzleOptions}>
      <LoadingContainer>
        <div>
          <AccountData accountIndex={0} units={"ether"} precision={3} />
          <h5>Warehouse Stock </h5>
          <ContractData contract="Supplychain" method="getWarehouseStock"/> 

          <h5>Roasting Data </h5>
          <ContractData contract="Supplychain" method="getRoastingData"/> 

          <h5>Shipping Details</h5>
          <ContractData contract="Supplychain" method="getshippingDetails"/> 

          <h5>Enter Count </h5>
          <ContractForm contract="Supplychain" method="setCount"/>

          <h5>Enter Shipping Data:</h5>
          <ContractForm contract="Supplychain" method="addShippingDetails"/>

          <h5>Enter Roasting Data:</h5>
          <ContractForm contract="Supplychain" method="addWarehouseStock"/>

          <h5>Enter Warehousing Data:</h5>
          <ContractForm contract="Supplychain" method="addRoastingData"/>
          
        </div>
      </LoadingContainer> 
    </DrizzleProvider>
  );
}

export default App;
