(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
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

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (rec__traversal__int_acc__is_null_pointer Bool)(rec__traversal__int_acc__pointer_address Int)(rec__traversal__int_acc__pointer_value integer)))))
(define-fun us_rep_rec__traversal__int_acc__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__traversal__int_acc__is_null_pointer a))

(define-fun us_rep_rec__traversal__int_acc__pointer_address__projection ((a us_rep)) Int 
  (rec__traversal__int_acc__pointer_address a))

(define-fun us_rep_rec__traversal__int_acc__pointer_value__projection ((a us_rep)) integer 
  (rec__traversal__int_acc__pointer_value a))

(declare-datatypes ()
((us_rep__ref (us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__traversal__int_acc__is_null_pointer a) 
                        (rec__traversal__int_acc__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__traversal__int_acc__is_null_pointer a) true))
                        (and
                        (= (rec__traversal__int_acc__pointer_address a) 
                        (rec__traversal__int_acc__pointer_address b))
                        (= (rec__traversal__int_acc__pointer_value a) 
                        (rec__traversal__int_acc__pointer_value b)))))
                   true false))

(define-fun rec__traversal__int_acc__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__traversal__int_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__traversal__int_acc__is_null_pointer us_null_pointer) true))

(declare-const dummy1 us_rep)

(declare-datatypes ()
((int_acc__ref (int_acc__refqtmk (int_acc__content us_rep)))))
(define-fun int_acc__ref_int_acc__content__projection ((a int_acc__ref)) us_rep 
  (int_acc__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__traversal__two_acc__fst us_rep)(rec__traversal__two_acc__snd us_rep)))))
(define-fun us_split_fields_rec__traversal__two_acc__fst__projection ((a us_split_fields)) us_rep 
  (rec__traversal__two_acc__fst a))

(define-fun us_split_fields_rec__traversal__two_acc__snd__projection ((a us_split_fields)) us_rep 
  (rec__traversal__two_acc__snd a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep1 (us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (bool_eq
                            (rec__traversal__two_acc__fst
                            (us_split_fields1 a))
                            (rec__traversal__two_acc__fst
                            (us_split_fields1 b))) true)
                         (= (bool_eq
                            (rec__traversal__two_acc__snd
                            (us_split_fields1 a))
                            (rec__traversal__two_acc__snd
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

(declare-const traversal__two_acc__fst__first__bit Int)

(declare-const traversal__two_acc__fst__last__bit Int)

(declare-const traversal__two_acc__fst__position Int)

;; traversal__two_acc__fst__first__bit_axiom
  (assert (<= 0 traversal__two_acc__fst__first__bit))

;; traversal__two_acc__fst__last__bit_axiom
  (assert
  (< traversal__two_acc__fst__first__bit traversal__two_acc__fst__last__bit))

;; traversal__two_acc__fst__position_axiom
  (assert (<= 0 traversal__two_acc__fst__position))

(declare-const traversal__two_acc__snd__first__bit Int)

(declare-const traversal__two_acc__snd__last__bit Int)

(declare-const traversal__two_acc__snd__position Int)

;; traversal__two_acc__snd__first__bit_axiom
  (assert (<= 0 traversal__two_acc__snd__first__bit))

;; traversal__two_acc__snd__last__bit_axiom
  (assert
  (< traversal__two_acc__snd__first__bit traversal__two_acc__snd__last__bit))

;; traversal__two_acc__snd__position_axiom
  (assert (<= 0 traversal__two_acc__snd__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ()
((two_acc__ref (two_acc__refqtmk (two_acc__content us_rep1)))))
(define-fun two_acc__ref_two_acc__content__projection ((a two_acc__ref)) us_rep1 
  (two_acc__content a))

(declare-datatypes ()
((us_rep2
 (us_repqtmk2
 (rec__traversal__two_acc_acc__is_null_pointer Bool)(rec__traversal__two_acc_acc__pointer_address Int)(rec__traversal__two_acc_acc__pointer_value us_rep1)))))
(define-fun us_rep_rec__traversal__two_acc_acc__is_null_pointer__projection ((a us_rep2)) Bool 
  (rec__traversal__two_acc_acc__is_null_pointer a))

(define-fun us_rep_rec__traversal__two_acc_acc__pointer_address__projection ((a us_rep2)) Int 
  (rec__traversal__two_acc_acc__pointer_address a))

(define-fun us_rep_rec__traversal__two_acc_acc__pointer_value__projection ((a us_rep2)) us_rep1 
  (rec__traversal__two_acc_acc__pointer_value a))

(declare-datatypes ()
((us_rep__ref1 (us_rep__refqtmk1 (us_rep__content1 us_rep2)))))
(define-fun us_rep__ref___rep__content__2__projection ((a us_rep__ref1)) us_rep2 
  (us_rep__content1 a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (rec__traversal__two_acc_acc__is_null_pointer a) 
                         (rec__traversal__two_acc_acc__is_null_pointer b))
                         (=>
                         (not
                         (= (rec__traversal__two_acc_acc__is_null_pointer a) true))
                         (and
                         (= (rec__traversal__two_acc_acc__pointer_address a) 
                         (rec__traversal__two_acc_acc__pointer_address b))
                         (= (rec__traversal__two_acc_acc__pointer_value a) 
                         (rec__traversal__two_acc_acc__pointer_value b)))))
                    true false))

(define-fun rec__traversal__two_acc_acc__pointer_value__pred ((a us_rep2)) Bool 
  (not (= (rec__traversal__two_acc_acc__is_null_pointer a) true)))

(declare-const us_null_pointer1 us_rep2)

;; __null_pointer__def_axiom
  (assert
  (= (rec__traversal__two_acc_acc__is_null_pointer us_null_pointer1) true))

(declare-const dummy3 us_rep2)

(declare-datatypes () ((t1b__ref (t1b__refqtmk (t1b__content us_rep2)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) us_rep2 
  (t1b__content a))

(declare-const dummy4 us_rep)

(declare-datatypes () ((t2b__ref (t2b__refqtmk (t2b__content us_rep)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) us_rep (t2b__content
                                                                    a))

(declare-fun get_fst (us_rep2) us_rep)

(declare-fun get_fst__function_guard (us_rep us_rep2) Bool)

(declare-sort us_pledge_ty 0)

(declare-datatypes ()
((us_pledge_ty__ref
 (us_pledge_ty__refqtmk (us_pledge_ty__content us_pledge_ty)))))
(declare-fun us_pledge_get (us_pledge_ty us_rep2 us_rep) Bool)

(declare-fun traversal__get_fst__pledge (us_rep2) us_pledge_ty)

(declare-const dummy5 us_rep2)

(declare-datatypes ()
((two_acc_acc__ref (two_acc_acc__refqtmk (two_acc_acc__content us_rep2)))))
(define-fun two_acc_acc__ref_two_acc_acc__content__projection ((a two_acc_acc__ref)) us_rep2 
  (two_acc_acc__content a))

;; get_fst__post_axiom
  (assert
  (forall ((x us_rep2))
  (! (=> (not (= (bool_eq2 x us_null_pointer1) true))
     (let ((result (get_fst x)))
     (=> (get_fst__function_guard result x)
     (= (us_pledge_get (traversal__get_fst__pledge x) x result) true)))) :pattern (
  (get_fst x)) )))

;; get_fst__def_axiom
  (assert
  (forall ((x us_rep2))
  (! (= (get_fst x) (rec__traversal__two_acc__fst
                    (us_split_fields1
                    (rec__traversal__two_acc_acc__pointer_value x)))) :pattern (
  (get_fst x)) )))

;; get_fst__pledge_axiom
  (assert
  (forall ((x us_rep2))
  (forall ((temp___borrowed_202 us_rep2))
  (forall ((temp___brower_200 us_rep))
  (! (=
     (= (us_pledge_get (traversal__get_fst__pledge x) temp___borrowed_202
        temp___brower_200) true)
     (= (us_repqtmk2 (rec__traversal__two_acc_acc__is_null_pointer x)
        (rec__traversal__two_acc_acc__pointer_address x)
        (let ((temp___201 (rec__traversal__two_acc_acc__pointer_value x)))
        (us_repqtmk1
        (let ((q_ (us_split_fields1 temp___201)))
        (us_split_fieldsqtmk temp___brower_200
        (rec__traversal__two_acc__snd q_)))))) temp___borrowed_202)) :pattern (
  (us_pledge_get (traversal__get_fst__pledge x) temp___borrowed_202
  temp___brower_200)) )))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const dummy6 us_rep)

(declare-datatypes () ((t13b__ref (t13b__refqtmk (t13b__content us_rep)))))
(define-fun t13b__ref_t13b__content__projection ((a t13b__ref)) us_rep 
  (t13b__content a))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort us_pledge_ty1 0)

(declare-datatypes ()
((us_pledge_ty__ref1
 (us_pledge_ty__refqtmk1 (us_pledge_ty__content1 us_pledge_ty1)))))
(declare-fun us_pledge_get1 (us_pledge_ty1 us_rep2 us_rep) Bool)

(define-fun default_initial_assumption ((temp___expr_182 us_rep)
  (temp___skip_top_level_183 Bool)) Bool (= (rec__traversal__int_acc__is_null_pointer
                                            temp___expr_182) true))

(define-fun default_initial_assumption1 ((temp___expr_198 us_rep2)
  (temp___skip_top_level_199 Bool)) Bool (= (rec__traversal__two_acc_acc__is_null_pointer
                                            temp___expr_198) true))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun default_initial_assumption2 ((temp___expr_189 us_rep1)
  (temp___skip_top_level_190 Bool)) Bool (and
                                         (= (rec__traversal__int_acc__is_null_pointer
                                            (rec__traversal__two_acc__fst
                                            (us_split_fields1
                                            temp___expr_189))) true)
                                         (= (rec__traversal__int_acc__is_null_pointer
                                            (rec__traversal__two_acc__snd
                                            (us_split_fields1
                                            temp___expr_189))) true)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 4))

(declare-const us_next_pointer_address Int)

(declare-const traversal__v__assume us_rep)

;; H
  (assert
  (= (and (ite (and
               (not
               (= (rec__traversal__int_acc__is_null_pointer
                  traversal__v__assume) true))
               (= (rec__traversal__int_acc__pointer_address
                  traversal__v__assume) us_next_pointer_address))
          true false) (ite (= (rec__traversal__int_acc__pointer_value
                              traversal__v__assume) (of_rep 1))
                      true false)) true))

(declare-const v__pointer_value integer)

;; H
  (assert
  (= v__pointer_value (rec__traversal__int_acc__pointer_value
                      traversal__v__assume)))

(declare-const v__pointer_address Int)

;; H
  (assert
  (= v__pointer_address (rec__traversal__int_acc__pointer_address
                        traversal__v__assume)))

(declare-const v__is_null_pointer Bool)

;; H
  (assert
  (= v__is_null_pointer (rec__traversal__int_acc__is_null_pointer
                        traversal__v__assume)))

;; Assume
  (assert true)

(declare-const us_next_pointer_address1 Int)

(declare-const traversal__w__assume us_rep)

;; H
  (assert
  (= (and (ite (and
               (not
               (= (rec__traversal__int_acc__is_null_pointer
                  traversal__w__assume) true))
               (= (rec__traversal__int_acc__pointer_address
                  traversal__w__assume) us_next_pointer_address1))
          true false) (ite (= (rec__traversal__int_acc__pointer_value
                              traversal__w__assume) (of_rep 2))
                      true false)) true))

(declare-const w__pointer_value integer)

;; H
  (assert
  (= w__pointer_value (rec__traversal__int_acc__pointer_value
                      traversal__w__assume)))

(declare-const w__pointer_address Int)

;; H
  (assert
  (= w__pointer_address (rec__traversal__int_acc__pointer_address
                        traversal__w__assume)))

(declare-const w__is_null_pointer Bool)

;; H
  (assert
  (= w__is_null_pointer (rec__traversal__int_acc__is_null_pointer
                        traversal__w__assume)))

;; Assume
  (assert true)

(declare-const us_next_pointer_address2 Int)

(declare-const traversal__x__assume us_rep2)

;; H
  (assert
  (= (and (ite (and
               (not
               (= (rec__traversal__two_acc_acc__is_null_pointer
                  traversal__x__assume) true))
               (= (rec__traversal__two_acc_acc__pointer_address
                  traversal__x__assume) us_next_pointer_address2))
          true false) (ite (= (rec__traversal__two_acc_acc__pointer_value
                              traversal__x__assume) (us_repqtmk1
                                                    (us_split_fieldsqtmk
                                                    (us_repqtmk
                                                    v__is_null_pointer
                                                    v__pointer_address
                                                    v__pointer_value)
                                                    (us_repqtmk
                                                    w__is_null_pointer
                                                    w__pointer_address
                                                    w__pointer_value))))
                      true false)) true))

(declare-const x__pointer_value us_split_fields)

;; H
  (assert
  (= (us_repqtmk1 x__pointer_value) (rec__traversal__two_acc_acc__pointer_value
                                    traversal__x__assume)))

(declare-const x__pointer_address Int)

;; H
  (assert
  (= x__pointer_address (rec__traversal__two_acc_acc__pointer_address
                        traversal__x__assume)))

(declare-const x__is_null_pointer Bool)

;; H
  (assert
  (= x__is_null_pointer (rec__traversal__two_acc_acc__is_null_pointer
                        traversal__x__assume)))

;; Assume
  (assert true)

(define-fun o () us_rep2 (us_repqtmk2 x__is_null_pointer x__pointer_address
                         (us_repqtmk1 x__pointer_value)))

(define-fun traversal__B_1__y__assume () us_rep (get_fst o))

;; H
  (assert (get_fst__function_guard traversal__B_1__y__assume o))

;; H
  (assert
  (and
  (= traversal__B_1__y__assume (rec__traversal__two_acc__fst
                               x__pointer_value))
  (= (us_pledge_get (traversal__get_fst__pledge o) o
     traversal__B_1__y__assume) true)))

(declare-const usf us_pledge_ty1)

;; Ensures
  (assert
  (forall ((temp___borrowed_212 us_rep2))
  (forall ((temp___brower_210 us_rep))
  (! (= (us_pledge_get1 usf temp___borrowed_212 temp___brower_210) (ite 
                                                                   (exists
                                                                   ((temp___borrowed_211 us_rep2))
                                                                   (and
                                                                   (= 
                                                                   x__is_null_pointer 
                                                                   (rec__traversal__two_acc_acc__is_null_pointer
                                                                   temp___borrowed_211))
                                                                   (= (and 
                                                                   (ite (= temp___borrowed_212 temp___borrowed_211)
                                                                   true
                                                                   false) (and 
                                                                   (us_pledge_get
                                                                   (traversal__get_fst__pledge
                                                                   (us_repqtmk2
                                                                   x__is_null_pointer
                                                                   x__pointer_address
                                                                   (us_repqtmk1
                                                                   x__pointer_value)))
                                                                   temp___borrowed_211
                                                                   temp___brower_210) 
                                                                   (ite true
                                                                   true
                                                                   false))) true)))
                                                                   true
                                                                   false)) :pattern (
  (us_pledge_get1 usf temp___borrowed_212 temp___brower_210)) ))))

(declare-const traversal__B_1__y__pledge us_pledge_ty1)

;; H
  (assert (= traversal__B_1__y__pledge usf))

(declare-const y__pointer_value integer)

;; H
  (assert
  (= y__pointer_value (rec__traversal__int_acc__pointer_value
                      traversal__B_1__y__assume)))

(declare-const y__pointer_address Int)

;; H
  (assert
  (= y__pointer_address (rec__traversal__int_acc__pointer_address
                        traversal__B_1__y__assume)))

(declare-const y__is_null_pointer Bool)

;; H
  (assert
  (= y__is_null_pointer (rec__traversal__int_acc__is_null_pointer
                        traversal__B_1__y__assume)))

(declare-const y__pointer_value1 integer)

;; H
  (assert (= y__pointer_value1 rliteral))

(declare-const usf1 us_rep2)

;; Assume
  (assert
  (and
  (= (us_pledge_get1 traversal__B_1__y__pledge usf1
     (us_repqtmk y__is_null_pointer y__pointer_address y__pointer_value1)) true)
  (= x__is_null_pointer (rec__traversal__two_acc_acc__is_null_pointer usf1))))

(declare-const x__pointer_value1 us_split_fields)

;; H
  (assert
  (= (us_repqtmk1 x__pointer_value1) (rec__traversal__two_acc_acc__pointer_value
                                     usf1)))

(declare-const x__pointer_address1 Int)

;; H
  (assert
  (= x__pointer_address1 (rec__traversal__two_acc_acc__pointer_address usf1)))

(declare-const x__is_null_pointer1 Bool)

;; H
  (assert
  (= x__is_null_pointer1 (rec__traversal__two_acc_acc__is_null_pointer usf1)))

(assert
;; defqtvc
 ;; File "traversal.adb", line 1, characters 0-0
  (not (rec__traversal__two_acc_acc__pointer_value__pred
  (us_repqtmk2 x__is_null_pointer1 x__pointer_address1
  (us_repqtmk1 x__pointer_value1)))))
(check-sat)
