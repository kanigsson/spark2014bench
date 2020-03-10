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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

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
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort us_main_type 0)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__test_list__list__is_null_pointer Bool)(rec__test_list__list__pointer_address Int)(rec__test_list__list__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__test_list__list__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__test_list__list__is_null_pointer a))

(define-fun us_rep_rec__test_list__list__pointer_address__projection ((a us_rep)) Int 
  (rec__test_list__list__pointer_address a))

(define-fun us_rep_rec__test_list__list__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__test_list__list__pointer_value_abstr a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__test_list__list__is_null_pointer a) 
                        (rec__test_list__list__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__test_list__list__is_null_pointer a) true))
                        (and
                        (= (rec__test_list__list__pointer_address a) 
                        (rec__test_list__list__pointer_address b))
                        (= (rec__test_list__list__pointer_value_abstr a) 
                        (rec__test_list__list__pointer_value_abstr b)))))
                   true false))

(declare-const dummy1 us_rep)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content us_rep)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) us_rep (t1b__content
                                                                    a))

(declare-const dummy2 us_rep)

(declare-datatypes ((t2b__ref 0))
(((t2b__refqtmk (t2b__content us_rep)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) us_rep (t2b__content
                                                                    a))

(declare-fun tail_2 (us_rep) us_rep)

(declare-fun tail_2__function_guard (us_rep us_rep) Bool)

(declare-sort us_pledge_ty 0)

(declare-datatypes ((us_pledge_ty__ref 0))
(((us_pledge_ty__refqtmk (us_pledge_ty__content us_pledge_ty)))))
(declare-fun us_pledge_get (us_pledge_ty us_rep us_rep) Bool)

(declare-fun test_list__tail_2__pledge (us_rep) us_pledge_ty)

(declare-const dummy3 us_rep)

(declare-datatypes ((list__ref 0))
(((list__refqtmk (list__content us_rep)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_rep 
  (list__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__test_list__list_cell__data integer)(rec__test_list__list_cell__next us_rep)))))
(define-fun us_split_fields_rec__test_list__list_cell__data__projection ((a us_split_fields)) integer 
  (rec__test_list__list_cell__data a))

(define-fun us_split_fields_rec__test_list__list_cell__next__projection ((a us_split_fields)) us_rep 
  (rec__test_list__list_cell__next a))

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
                            (rec__test_list__list_cell__data
                            (us_split_fields1 a))) (to_rep
                                                   (rec__test_list__list_cell__data
                                                   (us_split_fields1 b))))
                         (= (bool_eq
                            (rec__test_list__list_cell__next
                            (us_split_fields1 a))
                            (rec__test_list__list_cell__next
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

(declare-const test_list__list_cell__data__first__bit Int)

(declare-const test_list__list_cell__data__last__bit Int)

(declare-const test_list__list_cell__data__position Int)

;; test_list__list_cell__data__first__bit_axiom
  (assert (<= 0 test_list__list_cell__data__first__bit))

;; test_list__list_cell__data__last__bit_axiom
  (assert
  (< test_list__list_cell__data__first__bit test_list__list_cell__data__last__bit))

;; test_list__list_cell__data__position_axiom
  (assert (<= 0 test_list__list_cell__data__position))

(declare-const test_list__list_cell__next__first__bit Int)

(declare-const test_list__list_cell__next__last__bit Int)

(declare-const test_list__list_cell__next__position Int)

;; test_list__list_cell__next__first__bit_axiom
  (assert (<= 0 test_list__list_cell__next__first__bit))

;; test_list__list_cell__next__last__bit_axiom
  (assert
  (< test_list__list_cell__next__first__bit test_list__list_cell__next__last__bit))

;; test_list__list_cell__next__position_axiom
  (assert (<= 0 test_list__list_cell__next__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ((list_cell__ref 0))
(((list_cell__refqtmk (list_cell__content us_rep1)))))
(define-fun list_cell__ref_list_cell__content__projection ((a list_cell__ref)) us_rep1 
  (list_cell__content a))

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

(define-fun rec__test_list__list__pointer_value ((a us_rep)) us_rep1 
  (us_open (rec__test_list__list__pointer_value_abstr a)))

(define-fun rec__test_list__list__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__test_list__list__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert (= (rec__test_list__list__is_null_pointer us_null_pointer) true))

;; tail_2__post_axiom
  (assert
  (forall ((l us_rep))
  (! (=>
     (and (not (= (bool_eq l us_null_pointer) true))
     (not
     (= (bool_eq
        (rec__test_list__list_cell__next
        (us_split_fields1 (rec__test_list__list__pointer_value l)))
        us_null_pointer) true)))
     (let ((result (tail_2 l)))
     (=> (tail_2__function_guard result l)
     (= (us_pledge_get (test_list__tail_2__pledge l) l result) true)))) :pattern (
  (tail_2 l)) )))

;; tail_2__def_axiom
  (assert
  (forall ((l us_rep))
  (! (= (tail_2 l) (rec__test_list__list_cell__next
                   (us_split_fields1
                   (rec__test_list__list__pointer_value
                   (rec__test_list__list_cell__next
                   (us_split_fields1 (rec__test_list__list__pointer_value l))))))) :pattern (
  (tail_2 l)) )))

;; tail_2__pledge_axiom
  (assert
  (forall ((l us_rep))
  (forall ((temp___borrowed_196 us_rep))
  (forall ((temp___brower_192 us_rep))
  (! (=
     (= (us_pledge_get (test_list__tail_2__pledge l) temp___borrowed_196
        temp___brower_192) true)
     (= (us_repqtmk (rec__test_list__list__is_null_pointer l)
        (rec__test_list__list__pointer_address l)
        (us_close
        (let ((temp___195 (rec__test_list__list__pointer_value l)))
        (us_repqtmk1
        (let ((q_ (us_split_fields1 temp___195)))
        (us_split_fieldsqtmk (rec__test_list__list_cell__data q_)
        (let ((temp___194 (rec__test_list__list_cell__next
                          (us_split_fields1
                          (rec__test_list__list__pointer_value l)))))
        (us_repqtmk (rec__test_list__list__is_null_pointer temp___194)
        (rec__test_list__list__pointer_address temp___194)
        (us_close
        (let ((temp___193 (rec__test_list__list__pointer_value
                          (rec__test_list__list_cell__next
                          (us_split_fields1
                          (rec__test_list__list__pointer_value l))))))
        (us_repqtmk1
        (let ((q_1 (us_split_fields1 temp___193)))
        (us_split_fieldsqtmk (rec__test_list__list_cell__data q_1)
        temp___brower_192))))))))))))) temp___borrowed_196)) :pattern (
  (us_pledge_get (test_list__tail_2__pledge l) temp___borrowed_196
  temp___brower_192)) )))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const dummy5 us_rep)

(declare-datatypes ((t12b__ref 0))
(((t12b__refqtmk (t12b__content us_rep)))))
(define-fun t12b__ref_t12b__content__projection ((a t12b__ref)) us_rep 
  (t12b__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort us_pledge_ty1 0)

(declare-datatypes ((us_pledge_ty__ref1 0))
(((us_pledge_ty__refqtmk1 (us_pledge_ty__content1 us_pledge_ty1)))))
(declare-fun us_pledge_get1 (us_pledge_ty1 us_rep us_rep) Bool)

(define-fun default_initial_assumption ((temp___expr_181 us_rep)
  (temp___skip_top_level_182 Bool)) Bool (= (rec__test_list__list__is_null_pointer
                                            temp___expr_181) true))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun default_initial_assumption1 ((temp___expr_188 us_rep1)
  (temp___skip_top_level_189 Bool)) Bool (= (rec__test_list__list__is_null_pointer
                                            (rec__test_list__list_cell__next
                                            (us_split_fields1
                                            temp___expr_188))) true))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 2))

(declare-const rliteral2 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral2) 3))

(declare-const rliteral3 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral3) 4))

(declare-const rliteral4 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral4) 5))

(declare-const rliteral5 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral5) 42))

(assert
;; defqtvc
 ;; File "test_list.adb", line 1, characters 0-0
  (not
  (forall ((x__pointer_value us_split_fields) (x__pointer_address Int)
  (x__is_null_pointer Bool) (us_next_pointer_address Int) (temp___199 us_rep)
  (x__pointer_value1 us_split_fields) (x__pointer_address1 Int)
  (x__is_null_pointer1 Bool) (us_next_pointer_address1 Int) (o us_rep)
  (x__pointer_value2 us_split_fields))
  (=> (default_initial_assumption
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk1 x__pointer_value))) false)
  (=>
  (= (and (ite (and
               (not
               (= (rec__test_list__list__is_null_pointer temp___199) true))
               (= (rec__test_list__list__pointer_address temp___199) us_next_pointer_address))
          true false) (ite (= (rec__test_list__list__pointer_value
                              temp___199) (us_repqtmk1
                                          (us_split_fieldsqtmk rliteral
                                          us_null_pointer)))
                      true false)) true)
  (=>
  (= (us_repqtmk1 x__pointer_value1) (rec__test_list__list__pointer_value
                                     temp___199))
  (=>
  (= x__pointer_address1 (rec__test_list__list__pointer_address temp___199))
  (=>
  (= x__is_null_pointer1 (rec__test_list__list__is_null_pointer temp___199))
  (=>
  (= (and (ite (and (not (= (rec__test_list__list__is_null_pointer o) true))
               (= (rec__test_list__list__pointer_address o) us_next_pointer_address1))
          true false) (ite (= (rec__test_list__list__pointer_value o) 
                      (us_repqtmk1
                      (us_split_fieldsqtmk rliteral1 us_null_pointer))) true
                      false)) true)
  (=>
  (= (us_repqtmk1 x__pointer_value2) (rec__test_list__list__pointer_value
                                     (us_repqtmk x__is_null_pointer1
                                     x__pointer_address1
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk
                                     (rec__test_list__list_cell__data
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (us_repqtmk x__is_null_pointer1
                                     x__pointer_address1
                                     (us_close
                                     (us_repqtmk1 x__pointer_value1)))))) o))))))
  (let ((temp___204 (rec__test_list__list_cell__next
                    (us_split_fields1
                    (rec__test_list__list__pointer_value
                    (us_repqtmk x__is_null_pointer1 x__pointer_address1
                    (us_close (us_repqtmk1 x__pointer_value2))))))))
  (forall ((us_next_pointer_address2 Int))
  (forall ((o1 us_rep))
  (=>
  (= (and (ite (and (not (= (rec__test_list__list__is_null_pointer o1) true))
               (= (rec__test_list__list__pointer_address o1) us_next_pointer_address2))
          true false) (ite (= (rec__test_list__list__pointer_value o1) 
                      (us_repqtmk1
                      (us_split_fieldsqtmk rliteral2 us_null_pointer))) true
                      false)) true)
  (forall ((x__pointer_value3 us_split_fields))
  (=>
  (= (us_repqtmk1 x__pointer_value3) (rec__test_list__list__pointer_value
                                     (us_repqtmk x__is_null_pointer1
                                     x__pointer_address1
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk
                                     (rec__test_list__list_cell__data
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (us_repqtmk x__is_null_pointer1
                                     x__pointer_address1
                                     (us_close
                                     (us_repqtmk1 x__pointer_value2))))))
                                     (us_repqtmk
                                     (rec__test_list__list__is_null_pointer
                                     temp___204)
                                     (rec__test_list__list__pointer_address
                                     temp___204)
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk
                                     (rec__test_list__list_cell__data
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (rec__test_list__list_cell__next
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (us_repqtmk x__is_null_pointer1
                                     x__pointer_address1
                                     (us_close
                                     (us_repqtmk1 x__pointer_value2)))))))))
                                     o1))))))))))
  (let ((temp___211 (rec__test_list__list_cell__next
                    (us_split_fields1
                    (rec__test_list__list__pointer_value
                    (us_repqtmk x__is_null_pointer1 x__pointer_address1
                    (us_close (us_repqtmk1 x__pointer_value3))))))))
  (let ((temp___209 (rec__test_list__list_cell__next
                    (us_split_fields1
                    (rec__test_list__list__pointer_value
                    (rec__test_list__list_cell__next
                    (us_split_fields1
                    (rec__test_list__list__pointer_value
                    (us_repqtmk x__is_null_pointer1 x__pointer_address1
                    (us_close (us_repqtmk1 x__pointer_value3)))))))))))
  (forall ((us_next_pointer_address3 Int))
  (forall ((o2 us_rep))
  (=>
  (= (and (ite (and (not (= (rec__test_list__list__is_null_pointer o2) true))
               (= (rec__test_list__list__pointer_address o2) us_next_pointer_address3))
          true false) (ite (= (rec__test_list__list__pointer_value o2) 
                      (us_repqtmk1
                      (us_split_fieldsqtmk rliteral3 us_null_pointer))) true
                      false)) true)
  (forall ((x__pointer_value4 us_split_fields))
  (=>
  (= (us_repqtmk1 x__pointer_value4) (rec__test_list__list__pointer_value
                                     (us_repqtmk x__is_null_pointer1
                                     x__pointer_address1
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk
                                     (rec__test_list__list_cell__data
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (us_repqtmk x__is_null_pointer1
                                     x__pointer_address1
                                     (us_close
                                     (us_repqtmk1 x__pointer_value3))))))
                                     (us_repqtmk
                                     (rec__test_list__list__is_null_pointer
                                     temp___211)
                                     (rec__test_list__list__pointer_address
                                     temp___211)
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk
                                     (rec__test_list__list_cell__data
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (rec__test_list__list_cell__next
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (us_repqtmk x__is_null_pointer1
                                     x__pointer_address1
                                     (us_close
                                     (us_repqtmk1 x__pointer_value3)))))))))
                                     (us_repqtmk
                                     (rec__test_list__list__is_null_pointer
                                     temp___209)
                                     (rec__test_list__list__pointer_address
                                     temp___209)
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk
                                     (rec__test_list__list_cell__data
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (rec__test_list__list_cell__next
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (rec__test_list__list_cell__next
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (us_repqtmk x__is_null_pointer1
                                     x__pointer_address1
                                     (us_close
                                     (us_repqtmk1 x__pointer_value3))))))))))))
                                     o2))))))))))))))
  (let ((temp___220 (rec__test_list__list_cell__next
                    (us_split_fields1
                    (rec__test_list__list__pointer_value
                    (us_repqtmk x__is_null_pointer1 x__pointer_address1
                    (us_close (us_repqtmk1 x__pointer_value4))))))))
  (let ((temp___218 (rec__test_list__list_cell__next
                    (us_split_fields1
                    (rec__test_list__list__pointer_value
                    (rec__test_list__list_cell__next
                    (us_split_fields1
                    (rec__test_list__list__pointer_value
                    (us_repqtmk x__is_null_pointer1 x__pointer_address1
                    (us_close (us_repqtmk1 x__pointer_value4)))))))))))
  (let ((temp___216 (rec__test_list__list_cell__next
                    (us_split_fields1
                    (rec__test_list__list__pointer_value
                    (rec__test_list__list_cell__next
                    (us_split_fields1
                    (rec__test_list__list__pointer_value
                    (rec__test_list__list_cell__next
                    (us_split_fields1
                    (rec__test_list__list__pointer_value
                    (us_repqtmk x__is_null_pointer1 x__pointer_address1
                    (us_close (us_repqtmk1 x__pointer_value4))))))))))))))
  (forall ((us_next_pointer_address4 Int))
  (forall ((o3 us_rep))
  (=>
  (= (and (ite (and (not (= (rec__test_list__list__is_null_pointer o3) true))
               (= (rec__test_list__list__pointer_address o3) us_next_pointer_address4))
          true false) (ite (= (rec__test_list__list__pointer_value o3) 
                      (us_repqtmk1
                      (us_split_fieldsqtmk rliteral4 us_null_pointer))) true
                      false)) true)
  (forall ((x__pointer_value5 us_split_fields))
  (=>
  (= (us_repqtmk1 x__pointer_value5) (rec__test_list__list__pointer_value
                                     (us_repqtmk x__is_null_pointer1
                                     x__pointer_address1
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk
                                     (rec__test_list__list_cell__data
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (us_repqtmk x__is_null_pointer1
                                     x__pointer_address1
                                     (us_close
                                     (us_repqtmk1 x__pointer_value4))))))
                                     (us_repqtmk
                                     (rec__test_list__list__is_null_pointer
                                     temp___220)
                                     (rec__test_list__list__pointer_address
                                     temp___220)
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk
                                     (rec__test_list__list_cell__data
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (rec__test_list__list_cell__next
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (us_repqtmk x__is_null_pointer1
                                     x__pointer_address1
                                     (us_close
                                     (us_repqtmk1 x__pointer_value4)))))))))
                                     (us_repqtmk
                                     (rec__test_list__list__is_null_pointer
                                     temp___218)
                                     (rec__test_list__list__pointer_address
                                     temp___218)
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk
                                     (rec__test_list__list_cell__data
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (rec__test_list__list_cell__next
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (rec__test_list__list_cell__next
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (us_repqtmk x__is_null_pointer1
                                     x__pointer_address1
                                     (us_close
                                     (us_repqtmk1 x__pointer_value4))))))))))))
                                     (us_repqtmk
                                     (rec__test_list__list__is_null_pointer
                                     temp___216)
                                     (rec__test_list__list__pointer_address
                                     temp___216)
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk
                                     (rec__test_list__list_cell__data
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (rec__test_list__list_cell__next
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (rec__test_list__list_cell__next
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (rec__test_list__list_cell__next
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (us_repqtmk x__is_null_pointer1
                                     x__pointer_address1
                                     (us_close
                                     (us_repqtmk1 x__pointer_value4)))))))))))))))
                                     o3))))))))))))))))))
  (let ((o4 (us_repqtmk x__is_null_pointer1 x__pointer_address1
            (us_close (us_repqtmk1 x__pointer_value5)))))
  (let ((test_list__B_1__y__assume (tail_2 o4)))
  (=>
  (and (tail_2__function_guard test_list__B_1__y__assume o4)
  (and
  (= test_list__B_1__y__assume (rec__test_list__list_cell__next
                               (us_split_fields1
                               (rec__test_list__list__pointer_value
                               (rec__test_list__list_cell__next
                               (us_split_fields1
                               (rec__test_list__list__pointer_value o4)))))))
  (= (us_pledge_get (test_list__tail_2__pledge o4) o4
     test_list__B_1__y__assume) true)))
  (forall ((usf us_pledge_ty1))
  (=>
  (forall ((temp___borrowed_231 us_rep))
  (forall ((temp___brower_229 us_rep))
  (! (= (us_pledge_get1 usf temp___borrowed_231 temp___brower_229) (ite 
                                                                   (exists
                                                                   ((temp___borrowed_230 us_rep))
                                                                   (and
                                                                   (= x__is_null_pointer1 
                                                                   (rec__test_list__list__is_null_pointer
                                                                   temp___borrowed_230))
                                                                   (= (and 
                                                                   (ite (= temp___borrowed_231 temp___borrowed_230)
                                                                   true
                                                                   false) (and 
                                                                   (us_pledge_get
                                                                   (test_list__tail_2__pledge
                                                                   (us_repqtmk
                                                                   x__is_null_pointer1
                                                                   x__pointer_address1
                                                                   (us_close
                                                                   (us_repqtmk1
                                                                   x__pointer_value5))))
                                                                   temp___borrowed_230
                                                                   temp___brower_229) 
                                                                   (ite true
                                                                   true
                                                                   false))) true)))
                                                                   true
                                                                   false)) :pattern (
  (us_pledge_get1 usf temp___borrowed_231 temp___brower_229)) )))
  (forall ((test_list__B_1__y__pledge us_pledge_ty1))
  (=> (= test_list__B_1__y__pledge usf)
  (forall ((y__pointer_value us_split_fields))
  (=>
  (= (us_repqtmk1 y__pointer_value) (rec__test_list__list__pointer_value
                                    test_list__B_1__y__assume))
  (forall ((y__pointer_address Int))
  (=>
  (= y__pointer_address (rec__test_list__list__pointer_address
                        test_list__B_1__y__assume))
  (forall ((y__is_null_pointer Bool))
  (=>
  (= y__is_null_pointer (rec__test_list__list__is_null_pointer
                        test_list__B_1__y__assume))
  (forall ((y__pointer_value1 us_split_fields))
  (=>
  (= (us_repqtmk1 y__pointer_value1) (rec__test_list__list__pointer_value
                                     (us_repqtmk y__is_null_pointer
                                     y__pointer_address
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk rliteral5
                                     (rec__test_list__list_cell__next
                                     (us_split_fields1
                                     (rec__test_list__list__pointer_value
                                     (us_repqtmk y__is_null_pointer
                                     y__pointer_address
                                     (us_close
                                     (us_repqtmk1 y__pointer_value))))))))))))
  (forall ((usf1 us_rep))
  (=>
  (and
  (= (us_pledge_get1 test_list__B_1__y__pledge usf1
     (us_repqtmk y__is_null_pointer y__pointer_address
     (us_close (us_repqtmk1 y__pointer_value1)))) true)
  (= x__is_null_pointer1 (rec__test_list__list__is_null_pointer usf1)))
  (forall ((x__pointer_value6 us_split_fields))
  (=>
  (= (us_repqtmk1 x__pointer_value6) (rec__test_list__list__pointer_value
                                     usf1))
  (forall ((x__pointer_address2 Int))
  (=> (= x__pointer_address2 (rec__test_list__list__pointer_address usf1))
  (forall ((x__is_null_pointer2 Bool))
  (=> (= x__is_null_pointer2 (rec__test_list__list__is_null_pointer usf1))
  (=>
  (= (to_rep
     (rec__test_list__list_cell__data
     (us_split_fields1
     (rec__test_list__list__pointer_value
     (us_repqtmk x__is_null_pointer2 x__pointer_address2
     (us_close (us_repqtmk1 x__pointer_value6))))))) 1)
  (rec__test_list__list__pointer_value__pred
  (us_repqtmk x__is_null_pointer2 x__pointer_address2
  (us_close (us_repqtmk1 x__pointer_value6)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
