(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort us_main_type 0)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__list_borrow__list__is_null_pointer Bool)(rec__list_borrow__list__pointer_address Int)(rec__list_borrow__list__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__list_borrow__list__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__list_borrow__list__is_null_pointer a))

(define-fun us_rep_rec__list_borrow__list__pointer_address__projection ((a us_rep)) Int 
  (rec__list_borrow__list__pointer_address a))

(define-fun us_rep_rec__list_borrow__list__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__list_borrow__list__pointer_value_abstr a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__list_borrow__list__is_null_pointer a) 
                        (rec__list_borrow__list__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__list_borrow__list__is_null_pointer a) true))
                        (and
                        (= (rec__list_borrow__list__pointer_address a) 
                        (rec__list_borrow__list__pointer_address b))
                        (= (rec__list_borrow__list__pointer_value_abstr a) 
                        (rec__list_borrow__list__pointer_value_abstr b)))))
                   true false))

(declare-const dummy1 us_rep)

(declare-datatypes ((list__ref 0))
(((list__refqtmk (list__content us_rep)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_rep 
  (list__content a))

(declare-fun all_pos (us_rep) Bool)

(declare-fun all_pos__function_guard (Bool us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((list_pos__ref 0))
(((list_pos__refqtmk (list_pos__content us_rep)))))
(define-fun list_pos__ref_list_pos__content__projection ((a list_pos__ref)) us_rep 
  (list_pos__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__list_borrow__list_cell__value integer)(rec__list_borrow__list_cell__next us_rep)))))
(define-fun us_split_fields_rec__list_borrow__list_cell__value__projection ((a us_split_fields)) integer 
  (rec__list_borrow__list_cell__value a))

(define-fun us_split_fields_rec__list_borrow__list_cell__next__projection ((a us_split_fields)) us_rep 
  (rec__list_borrow__list_cell__next a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__list_borrow__list_cell__value
                            (us_split_fields1 a))) (to_rep
                                                   (rec__list_borrow__list_cell__value
                                                   (us_split_fields1 b))))
                         (= (bool_eq
                            (rec__list_borrow__list_cell__next
                            (us_split_fields1 a))
                            (rec__list_borrow__list_cell__next
                            (us_split_fields1 b))) true))
                    true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const list_borrow__list_cell__value__first__bit Int)

(declare-const list_borrow__list_cell__value__last__bit Int)

(declare-const list_borrow__list_cell__value__position Int)

;; list_borrow__list_cell__value__first__bit_axiom
  (assert (<= 0 list_borrow__list_cell__value__first__bit))

;; list_borrow__list_cell__value__last__bit_axiom
  (assert
  (< list_borrow__list_cell__value__first__bit list_borrow__list_cell__value__last__bit))

;; list_borrow__list_cell__value__position_axiom
  (assert (<= 0 list_borrow__list_cell__value__position))

(declare-const list_borrow__list_cell__next__first__bit Int)

(declare-const list_borrow__list_cell__next__last__bit Int)

(declare-const list_borrow__list_cell__next__position Int)

;; list_borrow__list_cell__next__first__bit_axiom
  (assert (<= 0 list_borrow__list_cell__next__first__bit))

;; list_borrow__list_cell__next__last__bit_axiom
  (assert
  (< list_borrow__list_cell__next__first__bit list_borrow__list_cell__next__last__bit))

;; list_borrow__list_cell__next__position_axiom
  (assert (<= 0 list_borrow__list_cell__next__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((list_cell__ref 0))
(((list_cell__refqtmk (list_cell__content us_rep1)))))
(define-fun list_cell__ref_list_cell__content__projection ((a list_cell__ref)) us_rep1 
  (list_cell__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const dummy4 us_rep)

(declare-datatypes ((t10b__ref 0))
(((t10b__refqtmk (t10b__content us_rep)))))
(define-fun t10b__ref_t10b__content__projection ((a t10b__ref)) us_rep 
  (t10b__content a))

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-sort us_pledge_ty 0)

(declare-datatypes ((us_pledge_ty__ref 0))
(((us_pledge_ty__refqtmk (us_pledge_ty__content us_pledge_ty)))))
(declare-fun us_pledge_get (us_pledge_ty us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((t11b__ref 0))
(((t11b__refqtmk (t11b__content us_rep)))))
(define-fun t11b__ref_t11b__content__projection ((a t11b__ref)) us_rep 
  (t11b__content a))

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-sort us_pledge_ty1 0)

(declare-datatypes ((us_pledge_ty__ref1 0))
(((us_pledge_ty__refqtmk1 (us_pledge_ty__content1 us_pledge_ty1)))))
(declare-fun us_pledge_get1 (us_pledge_ty1 us_rep us_rep) Bool)

(define-fun in_range1 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-fun us_open (us_main_type) us_rep1)

(declare-fun us_close (us_rep1) us_main_type)

;; close_open
  (assert
  (forall ((x us_main_type))
  (! (= (us_close (us_open x)) x) :pattern ((us_open x)) )))

;; open_close
  (assert
  (forall ((x us_rep1))
  (! (= (us_open (us_close x)) x) :pattern ((us_close x)) )))

(define-fun rec__list_borrow__list__pointer_value ((a us_rep)) us_rep1 
  (us_open (rec__list_borrow__list__pointer_value_abstr a)))

(define-fun rec__list_borrow__list__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__list_borrow__list__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert (= (rec__list_borrow__list__is_null_pointer us_null_pointer) true))

;; temp___result_201'def
  (assert
  (forall ((temp___200 us_rep)) (all_pos__function_guard (all_pos temp___200)
  temp___200)))

(define-fun dynamic_invariant ((temp___expr_199 us_rep)
  (temp___is_init_195 Bool) (temp___skip_constant_196 Bool)
  (temp___do_toplevel_197 Bool)
  (temp___do_typ_inv_198 Bool)) Bool (=> (= temp___do_toplevel_197 true)
                                     (= (all_pos temp___expr_199) true)))

(define-fun default_initial_assumption ((temp___expr_202 us_rep)
  (temp___skip_top_level_203 Bool)) Bool (= (rec__list_borrow__list__is_null_pointer
                                            temp___expr_202) true))

;; temp___result_206'def
  (assert
  (forall ((temp___205 us_rep)) (all_pos__function_guard (all_pos temp___205)
  temp___205)))

(define-fun dynamic_predicate ((temp___204 us_rep)) Bool (= (all_pos
                                                            temp___204) true))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun default_initial_assumption1 ((temp___expr_182 us_rep)
  (temp___skip_top_level_183 Bool)) Bool (= (rec__list_borrow__list__is_null_pointer
                                            temp___expr_182) true))

(define-fun default_initial_assumption2 ((temp___expr_189 us_rep1)
  (temp___skip_top_level_190 Bool)) Bool (= (rec__list_borrow__list__is_null_pointer
                                            (rec__list_borrow__list_cell__next
                                            (us_split_fields1
                                            temp___expr_189))) true))

;; all_pos__def_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (all_pos__function_guard (all_pos x) x)
     (and
     (forall ((x1 us_rep)) (all_pos__function_guard
     (all_pos
     (rec__list_borrow__list_cell__next
     (us_split_fields1 (rec__list_borrow__list__pointer_value x1))))
     (rec__list_borrow__list_cell__next
     (us_split_fields1 (rec__list_borrow__list__pointer_value x1)))))
     (= (= (all_pos x) true)
     (=> (not (= (bool_eq x us_null_pointer) true))
     (and
     (< 0 (to_rep
          (rec__list_borrow__list_cell__value
          (us_split_fields1 (rec__list_borrow__list__pointer_value x)))))
     (= (all_pos
        (rec__list_borrow__list_cell__next
        (us_split_fields1 (rec__list_borrow__list__pointer_value x)))) true)))))) :pattern (
  (all_pos x)) )))

;; all_pos__post_axiom
  (assert true)

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 2))

(declare-const rliteral2 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral2) 3))

(assert
;; defqtvc
 ;; File "list_borrow.adb", line 1, characters 0-0
  (not
  (forall ((us_next_pointer_address Int) (temp___208 us_rep)
  (x1__pointer_value us_split_fields) (x1__pointer_address Int)
  (x1__is_null_pointer Bool) (us_next_pointer_address1 Int)
  (temp___211 us_rep) (x2__pointer_value us_split_fields)
  (x2__pointer_address Int) (x2__is_null_pointer Bool)
  (us_next_pointer_address2 Int) (temp___214 us_rep)
  (x__pointer_value us_split_fields) (x__pointer_address Int)
  (x__is_null_pointer Bool) (us_next_pointer_address3 Int)
  (temp___217 us_rep) (z1__pointer_value us_split_fields)
  (z1__pointer_address Int) (z1__is_null_pointer Bool)
  (us_next_pointer_address4 Int) (temp___220 us_rep)
  (z2__pointer_value us_split_fields) (z2__pointer_address Int)
  (z2__is_null_pointer Bool) (us_next_pointer_address5 Int)
  (temp___223 us_rep) (z__pointer_value us_split_fields)
  (z__pointer_address Int) (z__is_null_pointer Bool) (usf us_pledge_ty)
  (list_borrow__B_1__y__pledge us_pledge_ty)
  (y__pointer_value us_split_fields) (y__pointer_address Int)
  (y__is_null_pointer Bool) (usf1 us_pledge_ty)
  (list_borrow__B_1__y__pledge1 us_pledge_ty))
  (=>
  (= (and (ite (and
               (not
               (= (rec__list_borrow__list__is_null_pointer temp___208) true))
               (= (rec__list_borrow__list__pointer_address temp___208) us_next_pointer_address))
          true false) (ite (= (rec__list_borrow__list__pointer_value
                              temp___208) (us_repqtmk1
                                          (us_split_fieldsqtmk rliteral
                                          us_null_pointer)))
                      true false)) true)
  (=>
  (forall ((temp___2081 us_rep)) (all_pos__function_guard
  (all_pos temp___2081) temp___2081))
  (=> (= (all_pos temp___208) true)
  (=>
  (= (us_repqtmk1 x1__pointer_value) (rec__list_borrow__list__pointer_value
                                     temp___208))
  (=>
  (= x1__pointer_address (rec__list_borrow__list__pointer_address temp___208))
  (=>
  (= x1__is_null_pointer (rec__list_borrow__list__is_null_pointer temp___208))
  (=> (dynamic_invariant
  (us_repqtmk x1__is_null_pointer x1__pointer_address
  (us_close (us_repqtmk1 x1__pointer_value))) true false true true)
  (=>
  (= (and (ite (and
               (not
               (= (rec__list_borrow__list__is_null_pointer temp___211) true))
               (= (rec__list_borrow__list__pointer_address temp___211) us_next_pointer_address1))
          true false) (ite (= (rec__list_borrow__list__pointer_value
                              temp___211) (us_repqtmk1
                                          (us_split_fieldsqtmk rliteral1
                                          (us_repqtmk x1__is_null_pointer
                                          x1__pointer_address
                                          (us_close
                                          (us_repqtmk1 x1__pointer_value))))))
                      true false)) true)
  (=>
  (forall ((temp___2111 us_rep)) (all_pos__function_guard
  (all_pos temp___2111) temp___2111))
  (=> (= (all_pos temp___211) true)
  (=>
  (= (us_repqtmk1 x2__pointer_value) (rec__list_borrow__list__pointer_value
                                     temp___211))
  (=>
  (= x2__pointer_address (rec__list_borrow__list__pointer_address temp___211))
  (=>
  (= x2__is_null_pointer (rec__list_borrow__list__is_null_pointer temp___211))
  (=> (dynamic_invariant
  (us_repqtmk x2__is_null_pointer x2__pointer_address
  (us_close (us_repqtmk1 x2__pointer_value))) true false true true)
  (=>
  (= (and (ite (and
               (not
               (= (rec__list_borrow__list__is_null_pointer temp___214) true))
               (= (rec__list_borrow__list__pointer_address temp___214) us_next_pointer_address2))
          true false) (ite (= (rec__list_borrow__list__pointer_value
                              temp___214) (us_repqtmk1
                                          (us_split_fieldsqtmk rliteral2
                                          (us_repqtmk x2__is_null_pointer
                                          x2__pointer_address
                                          (us_close
                                          (us_repqtmk1 x2__pointer_value))))))
                      true false)) true)
  (=>
  (forall ((temp___2141 us_rep)) (all_pos__function_guard
  (all_pos temp___2141) temp___2141))
  (=> (= (all_pos temp___214) true)
  (=>
  (= (us_repqtmk1 x__pointer_value) (rec__list_borrow__list__pointer_value
                                    temp___214))
  (=>
  (= x__pointer_address (rec__list_borrow__list__pointer_address temp___214))
  (=>
  (= x__is_null_pointer (rec__list_borrow__list__is_null_pointer temp___214))
  (=> (dynamic_invariant
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk1 x__pointer_value))) true false true true)
  (=>
  (= (and (ite (and
               (not
               (= (rec__list_borrow__list__is_null_pointer temp___217) true))
               (= (rec__list_borrow__list__pointer_address temp___217) us_next_pointer_address3))
          true false) (ite (= (rec__list_borrow__list__pointer_value
                              temp___217) (us_repqtmk1
                                          (us_split_fieldsqtmk rliteral
                                          us_null_pointer)))
                      true false)) true)
  (=>
  (forall ((temp___2171 us_rep)) (all_pos__function_guard
  (all_pos temp___2171) temp___2171))
  (=> (= (all_pos temp___217) true)
  (=>
  (= (us_repqtmk1 z1__pointer_value) (rec__list_borrow__list__pointer_value
                                     temp___217))
  (=>
  (= z1__pointer_address (rec__list_borrow__list__pointer_address temp___217))
  (=>
  (= z1__is_null_pointer (rec__list_borrow__list__is_null_pointer temp___217))
  (=> (dynamic_invariant
  (us_repqtmk z1__is_null_pointer z1__pointer_address
  (us_close (us_repqtmk1 z1__pointer_value))) true false true true)
  (=>
  (= (and (ite (and
               (not
               (= (rec__list_borrow__list__is_null_pointer temp___220) true))
               (= (rec__list_borrow__list__pointer_address temp___220) us_next_pointer_address4))
          true false) (ite (= (rec__list_borrow__list__pointer_value
                              temp___220) (us_repqtmk1
                                          (us_split_fieldsqtmk rliteral1
                                          (us_repqtmk z1__is_null_pointer
                                          z1__pointer_address
                                          (us_close
                                          (us_repqtmk1 z1__pointer_value))))))
                      true false)) true)
  (=>
  (forall ((temp___2201 us_rep)) (all_pos__function_guard
  (all_pos temp___2201) temp___2201))
  (=> (= (all_pos temp___220) true)
  (=>
  (= (us_repqtmk1 z2__pointer_value) (rec__list_borrow__list__pointer_value
                                     temp___220))
  (=>
  (= z2__pointer_address (rec__list_borrow__list__pointer_address temp___220))
  (=>
  (= z2__is_null_pointer (rec__list_borrow__list__is_null_pointer temp___220))
  (=> (dynamic_invariant
  (us_repqtmk z2__is_null_pointer z2__pointer_address
  (us_close (us_repqtmk1 z2__pointer_value))) true false true true)
  (=>
  (= (and (ite (and
               (not
               (= (rec__list_borrow__list__is_null_pointer temp___223) true))
               (= (rec__list_borrow__list__pointer_address temp___223) us_next_pointer_address5))
          true false) (ite (= (rec__list_borrow__list__pointer_value
                              temp___223) (us_repqtmk1
                                          (us_split_fieldsqtmk rliteral2
                                          (us_repqtmk z2__is_null_pointer
                                          z2__pointer_address
                                          (us_close
                                          (us_repqtmk1 z2__pointer_value))))))
                      true false)) true)
  (=>
  (forall ((temp___2231 us_rep)) (all_pos__function_guard
  (all_pos temp___2231) temp___2231))
  (=> (= (all_pos temp___223) true)
  (=>
  (= (us_repqtmk1 z__pointer_value) (rec__list_borrow__list__pointer_value
                                    temp___223))
  (=>
  (= z__pointer_address (rec__list_borrow__list__pointer_address temp___223))
  (=>
  (= z__is_null_pointer (rec__list_borrow__list__is_null_pointer temp___223))
  (=> (dynamic_invariant
  (us_repqtmk z__is_null_pointer z__pointer_address
  (us_close (us_repqtmk1 z__pointer_value))) true false true true)
  (=>
  (forall ((temp___borrowed_241 us_rep))
  (forall ((temp___brower_240 us_rep))
  (! (= (= (us_pledge_get usf temp___borrowed_241 temp___brower_240) true)
     (= temp___borrowed_241 temp___brower_240)) :pattern ((us_pledge_get usf
                                                          temp___borrowed_241
                                                          temp___brower_240)) )))
  (=> (= list_borrow__B_1__y__pledge usf)
  (=>
  (= (us_repqtmk1 y__pointer_value) (rec__list_borrow__list__pointer_value
                                    (us_repqtmk x__is_null_pointer
                                    x__pointer_address
                                    (us_close (us_repqtmk1 x__pointer_value)))))
  (=> (= y__pointer_address x__pointer_address)
  (=> (= y__is_null_pointer x__is_null_pointer)
  (=>
  (forall ((temp___borrowed_230 us_rep))
  (forall ((temp___brower_227 us_rep))
  (! (= (us_pledge_get usf1 temp___borrowed_230 temp___brower_227) (us_pledge_get
                                                                   list_borrow__B_1__y__pledge
                                                                   temp___borrowed_230
                                                                   (us_repqtmk
                                                                   y__is_null_pointer
                                                                   y__pointer_address
                                                                   (us_close
                                                                   (us_repqtmk1
                                                                   (us_split_fieldsqtmk
                                                                   (rec__list_borrow__list_cell__value
                                                                   (us_split_fields1
                                                                   (rec__list_borrow__list__pointer_value
                                                                   (us_repqtmk
                                                                   y__is_null_pointer
                                                                   y__pointer_address
                                                                   (us_close
                                                                   (us_repqtmk1
                                                                   y__pointer_value))))))
                                                                   temp___brower_227)))))) :pattern (
  (us_pledge_get usf1 temp___borrowed_230 temp___brower_227)) )))
  (=> (= list_borrow__B_1__y__pledge1 usf1)
  (let ((temp___226 (rec__list_borrow__list_cell__next
                    (us_split_fields1
                    (rec__list_borrow__list__pointer_value
                    (us_repqtmk y__is_null_pointer y__pointer_address
                    (us_close (us_repqtmk1 y__pointer_value))))))))
  (forall ((y__pointer_value1 us_split_fields))
  (=>
  (= (us_repqtmk1 y__pointer_value1) (rec__list_borrow__list__pointer_value
                                     temp___226))
  (forall ((y__pointer_address1 Int))
  (=>
  (= y__pointer_address1 (rec__list_borrow__list__pointer_address temp___226))
  (forall ((y__is_null_pointer1 Bool))
  (=>
  (= y__is_null_pointer1 (rec__list_borrow__list__is_null_pointer temp___226))
  (forall ((y__pointer_value2 us_split_fields))
  (=>
  (= (us_repqtmk1 y__pointer_value2) (rec__list_borrow__list__pointer_value
                                     (us_repqtmk y__is_null_pointer1
                                     y__pointer_address1
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk rliteral
                                     (rec__list_borrow__list_cell__next
                                     (us_split_fields1
                                     (rec__list_borrow__list__pointer_value
                                     (us_repqtmk y__is_null_pointer1
                                     y__pointer_address1
                                     (us_close
                                     (us_repqtmk1 y__pointer_value1))))))))))))
  (forall ((usf2 us_rep))
  (=>
  (and
  (= (us_pledge_get list_borrow__B_1__y__pledge1 usf2
     (us_repqtmk y__is_null_pointer1 y__pointer_address1
     (us_close (us_repqtmk1 y__pointer_value2)))) true)
  (= x__is_null_pointer (rec__list_borrow__list__is_null_pointer usf2)))
  (=> (forall ((usf3 us_rep)) (all_pos__function_guard (all_pos usf3) usf3))
  (=> (= (all_pos usf2) true)
  (forall ((x__pointer_value1 us_split_fields))
  (=>
  (= (us_repqtmk1 x__pointer_value1) (rec__list_borrow__list__pointer_value
                                     usf2))
  (forall ((x__pointer_address1 Int))
  (=> (= x__pointer_address1 (rec__list_borrow__list__pointer_address usf2))
  (forall ((x__is_null_pointer1 Bool))
  (=> (= x__is_null_pointer1 (rec__list_borrow__list__is_null_pointer usf2))
  (=>
  (= (to_rep
     (rec__list_borrow__list_cell__value
     (us_split_fields1
     (rec__list_borrow__list__pointer_value
     (us_repqtmk x__is_null_pointer1 x__pointer_address1
     (us_close (us_repqtmk1 x__pointer_value1))))))) 3)
  (rec__list_borrow__list__pointer_value__pred
  (us_repqtmk x__is_null_pointer1 x__pointer_address1
  (us_close (us_repqtmk1 x__pointer_value1))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
