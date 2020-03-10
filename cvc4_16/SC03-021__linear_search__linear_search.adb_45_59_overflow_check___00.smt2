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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(declare-sort us_main_type 0)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__linear_search__list__is_null_pointer Bool)(rec__linear_search__list__pointer_address Int)(rec__linear_search__list__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__linear_search__list__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__linear_search__list__is_null_pointer a))

(define-fun us_rep_rec__linear_search__list__pointer_address__projection ((a us_rep)) Int 
  (rec__linear_search__list__pointer_address a))

(define-fun us_rep_rec__linear_search__list__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__linear_search__list__pointer_value_abstr a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__2__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__linear_search__list__is_null_pointer a) 
                        (rec__linear_search__list__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__linear_search__list__is_null_pointer a) true))
                        (and
                        (= (rec__linear_search__list__pointer_address a) 
                        (rec__linear_search__list__pointer_address b))
                        (= (rec__linear_search__list__pointer_value_abstr a) 
                        (rec__linear_search__list__pointer_value_abstr b)))))
                   true false))

(declare-const dummy2 us_rep)

(declare-datatypes ((t2b__ref 0))
(((t2b__refqtmk (t2b__content us_rep)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) us_rep (t2b__content
                                                                    a))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (natural natural) Bool)

(declare-const dummy3 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range3
                                    temp___expr_39)))

(declare-const dummy4 us_rep)

(declare-datatypes ((list__ref 0))
(((list__refqtmk (list__content us_rep)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_rep 
  (list__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (rec__linear_search__int_acc__is_null_pointer Bool)(rec__linear_search__int_acc__pointer_address Int)(rec__linear_search__int_acc__pointer_value integer)))))
(define-fun us_rep_rec__linear_search__int_acc__is_null_pointer__projection ((a us_rep1)) Bool 
  (rec__linear_search__int_acc__is_null_pointer a))

(define-fun us_rep_rec__linear_search__int_acc__pointer_address__projection ((a us_rep1)) Int 
  (rec__linear_search__int_acc__pointer_address a))

(define-fun us_rep_rec__linear_search__int_acc__pointer_value__projection ((a us_rep1)) integer 
  (rec__linear_search__int_acc__pointer_value a))

(declare-datatypes ((us_rep__ref1 0))
(((us_rep__refqtmk1 (us_rep__content1 us_rep1)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref1)) us_rep1 
  (us_rep__content1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (rec__linear_search__int_acc__is_null_pointer a) 
                         (rec__linear_search__int_acc__is_null_pointer b))
                         (=>
                         (not
                         (= (rec__linear_search__int_acc__is_null_pointer a) true))
                         (and
                         (= (rec__linear_search__int_acc__pointer_address a) 
                         (rec__linear_search__int_acc__pointer_address b))
                         (= (rec__linear_search__int_acc__pointer_value a) 
                         (rec__linear_search__int_acc__pointer_value b)))))
                    true false))

(define-fun rec__linear_search__int_acc__pointer_value__pred ((a us_rep1)) Bool 
  (not (= (rec__linear_search__int_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep1)

;; __null_pointer__def_axiom
  (assert
  (= (rec__linear_search__int_acc__is_null_pointer us_null_pointer) true))

(declare-const dummy5 us_rep1)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content us_rep1)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) us_rep1 
  (t1b__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__linear_search__list_cell__data us_rep1)(rec__linear_search__list_cell__next us_rep)))))
(define-fun us_split_fields_rec__linear_search__list_cell__data__projection ((a us_split_fields)) us_rep1 
  (rec__linear_search__list_cell__data a))

(define-fun us_split_fields_rec__linear_search__list_cell__next__projection ((a us_split_fields)) us_rep 
  (rec__linear_search__list_cell__next a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep2)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (bool_eq1
                            (rec__linear_search__list_cell__data
                            (us_split_fields1 a))
                            (rec__linear_search__list_cell__data
                            (us_split_fields1 b))) true)
                         (= (bool_eq
                            (rec__linear_search__list_cell__next
                            (us_split_fields1 a))
                            (rec__linear_search__list_cell__next
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

(declare-const linear_search__list_cell__data__first__bit Int)

(declare-const linear_search__list_cell__data__last__bit Int)

(declare-const linear_search__list_cell__data__position Int)

;; linear_search__list_cell__data__first__bit_axiom
  (assert (<= 0 linear_search__list_cell__data__first__bit))

;; linear_search__list_cell__data__last__bit_axiom
  (assert
  (< linear_search__list_cell__data__first__bit linear_search__list_cell__data__last__bit))

;; linear_search__list_cell__data__position_axiom
  (assert (<= 0 linear_search__list_cell__data__position))

(declare-const linear_search__list_cell__next__first__bit Int)

(declare-const linear_search__list_cell__next__last__bit Int)

(declare-const linear_search__list_cell__next__position Int)

;; linear_search__list_cell__next__first__bit_axiom
  (assert (<= 0 linear_search__list_cell__next__first__bit))

;; linear_search__list_cell__next__last__bit_axiom
  (assert
  (< linear_search__list_cell__next__first__bit linear_search__list_cell__next__last__bit))

;; linear_search__list_cell__next__position_axiom
  (assert (<= 0 linear_search__list_cell__next__position))

(declare-fun user_eq3 (us_rep2 us_rep2) Bool)

(declare-const dummy6 us_rep2)

(declare-datatypes ((list_cell__ref 0))
(((list_cell__refqtmk (list_cell__content us_rep2)))))
(define-fun list_cell__ref_list_cell__content__projection ((a list_cell__ref)) us_rep2 
  (list_cell__content a))

(declare-fun us_open (us_main_type) us_rep2)

(declare-fun us_close (us_rep2) us_main_type)

;; close_open
  (assert
  (forall ((x us_main_type))
  (! (= (us_close (us_open x)) x) :pattern ((us_open x)) )))

;; open_close
  (assert
  (forall ((x us_rep2))
  (! (= (us_open (us_close x)) x) :pattern ((us_close x)) )))

(define-fun rec__linear_search__list__pointer_value ((a us_rep)) us_rep2 
  (us_open (rec__linear_search__list__pointer_value_abstr a)))

(define-fun rec__linear_search__list__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__linear_search__list__is_null_pointer a) true)))

(declare-const us_null_pointer1 us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__linear_search__list__is_null_pointer us_null_pointer1) true))

(declare-fun temp___dynamic_invariant_215 (us_rep Bool Bool Bool Bool) Bool)

(define-fun dynamic_invariant3 ((temp___expr_214 us_rep)
  (temp___is_init_210 Bool) (temp___skip_constant_211 Bool)
  (temp___do_toplevel_212 Bool)
  (temp___do_typ_inv_213 Bool)) Bool (=>
                                     (not
                                     (= (rec__linear_search__list__is_null_pointer
                                        temp___expr_214) true))
                                     (and
                                     (not
                                     (= (rec__linear_search__int_acc__is_null_pointer
                                        (rec__linear_search__list_cell__data
                                        (us_split_fields1
                                        (rec__linear_search__list__pointer_value
                                        temp___expr_214)))) true))
                                     (temp___dynamic_invariant_215
                                     (rec__linear_search__list_cell__next
                                     (us_split_fields1
                                     (rec__linear_search__list__pointer_value
                                     temp___expr_214))) true false true
                                     temp___do_typ_inv_213))))

;; def_axiom
  (assert
  (forall ((temp___expr_220 us_rep))
  (forall ((temp___is_init_216 Bool) (temp___skip_constant_217 Bool)
  (temp___do_toplevel_218 Bool) (temp___do_typ_inv_219 Bool))
  (! (= (temp___dynamic_invariant_215 temp___expr_220 temp___is_init_216
     temp___skip_constant_217 temp___do_toplevel_218 temp___do_typ_inv_219)
     (=>
     (not
     (= (rec__linear_search__list__is_null_pointer temp___expr_220) true))
     (and
     (not
     (= (rec__linear_search__int_acc__is_null_pointer
        (rec__linear_search__list_cell__data
        (us_split_fields1
        (rec__linear_search__list__pointer_value temp___expr_220)))) true))
     (temp___dynamic_invariant_215
     (rec__linear_search__list_cell__next
     (us_split_fields1
     (rec__linear_search__list__pointer_value temp___expr_220))) true false
     true temp___do_typ_inv_219)))) :pattern ((temp___dynamic_invariant_215
  temp___expr_220 temp___is_init_216 temp___skip_constant_217
  temp___do_toplevel_218 temp___do_typ_inv_219)) ))))

(define-fun default_initial_assumption ((temp___expr_221 us_rep)
  (temp___skip_top_level_222 Bool)) Bool (= (rec__linear_search__list__is_null_pointer
                                            temp___expr_221) true))

(define-fun dynamic_invariant4 ((temp___expr_227 us_rep2)
  (temp___is_init_223 Bool) (temp___skip_constant_224 Bool)
  (temp___do_toplevel_225 Bool)
  (temp___do_typ_inv_226 Bool)) Bool (and
                                     (not
                                     (= (rec__linear_search__int_acc__is_null_pointer
                                        (rec__linear_search__list_cell__data
                                        (us_split_fields1 temp___expr_227))) true))
                                     (=>
                                     (not
                                     (= (rec__linear_search__list__is_null_pointer
                                        (rec__linear_search__list_cell__next
                                        (us_split_fields1 temp___expr_227))) true))
                                     (and
                                     (not
                                     (= (rec__linear_search__int_acc__is_null_pointer
                                        (rec__linear_search__list_cell__data
                                        (us_split_fields1
                                        (rec__linear_search__list__pointer_value
                                        (rec__linear_search__list_cell__next
                                        (us_split_fields1 temp___expr_227)))))) true))
                                     (temp___dynamic_invariant_215
                                     (rec__linear_search__list_cell__next
                                     (us_split_fields1
                                     (rec__linear_search__list__pointer_value
                                     (rec__linear_search__list_cell__next
                                     (us_split_fields1 temp___expr_227)))))
                                     true false true temp___do_typ_inv_226)))))

(define-fun default_initial_assumption1 ((temp___expr_228 us_rep2)
  (temp___skip_top_level_229 Bool)) Bool (and
                                         (= (rec__linear_search__int_acc__is_null_pointer
                                            (rec__linear_search__list_cell__data
                                            (us_split_fields1
                                            temp___expr_228))) true)
                                         (= (rec__linear_search__list__is_null_pointer
                                            (rec__linear_search__list_cell__next
                                            (us_split_fields1
                                            temp___expr_228))) true)))

;; length__def_axiom
  (assert
  (forall ((l us_rep))
  (! (=>
     (=> (not (= (rec__linear_search__list__is_null_pointer l) true))
     (dynamic_invariant4 (rec__linear_search__list__pointer_value l) true
     false true true))
     (= (length l) (ite (= (bool_eq l us_null_pointer1) true) 0
                   (+ (min 2147483646
                      (length
                      (rec__linear_search__list_cell__next
                      (us_split_fields1
                      (rec__linear_search__list__pointer_value l))))) 1)))) :pattern (
  (length l)) )))

(declare-const dummy7 us_rep)

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content us_rep)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) us_rep (t3b__content
                                                                    a))

(declare-fun nth (us_rep Int) Int)

(declare-fun nth__function_guard (Int us_rep Int) Bool)

;; nth__def_axiom
  (assert
  (forall ((l us_rep))
  (forall ((n Int))
  (! (=>
     (and
     (=> (not (= (rec__linear_search__list__is_null_pointer l) true))
     (dynamic_invariant4 (rec__linear_search__list__pointer_value l) true
     false true true)) (dynamic_invariant1 n true true true true))
     (= (nth l n) (ite (= n 1)
                  (to_rep
                  (rec__linear_search__int_acc__pointer_value
                  (rec__linear_search__list_cell__data
                  (us_split_fields1
                  (rec__linear_search__list__pointer_value l)))))
                  (nth
                  (rec__linear_search__list_cell__next
                  (us_split_fields1
                  (rec__linear_search__list__pointer_value l))) (- n 1))))) :pattern (
  (nth l n)) ))))

(declare-const dummy8 us_rep)

(declare-datatypes ((t8b__ref 0))
(((t8b__refqtmk (t8b__content us_rep)))))
(define-fun t8b__ref_t8b__content__projection ((a t8b__ref)) us_rep (t8b__content
                                                                    a))

(declare-const l us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const v Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const dummy9 us_rep)

(declare-datatypes ((t12b__ref 0))
(((t12b__refqtmk (t12b__content us_rep)))))
(define-fun t12b__ref_t12b__content__projection ((a t12b__ref)) us_rep 
  (t12b__content a))

;; length__post_axiom
  (assert
  (forall ((l1 us_rep))
  (! (=>
     (=> (not (= (rec__linear_search__list__is_null_pointer l1) true))
     (dynamic_invariant4 (rec__linear_search__list__pointer_value l1) true
     false true true)) (dynamic_invariant2 (length l1) true false true true)) :pattern (
  (length l1)) )))

;; nth__post_axiom
  (assert
  (forall ((l1 us_rep))
  (forall ((n Int))
  (! (=>
     (and
     (and
     (=> (not (= (rec__linear_search__list__is_null_pointer l1) true))
     (dynamic_invariant4 (rec__linear_search__list__pointer_value l1) true
     false true true)) (dynamic_invariant1 n true true true true))
     (<= n (length l1))) (dynamic_invariant (nth l1 n) true false true true)) :pattern (
  (nth l1 n)) ))))

(assert
;; defqtvc
 ;; File "linear_search.adb", line 32, characters 0-0
  (not
  (=>
  (=> (not (= (rec__linear_search__list__is_null_pointer l) true))
  (dynamic_invariant4 (rec__linear_search__list__pointer_value l) true false
  true true))
  (=> (dynamic_invariant v true false true true)
  (=> (< (length l) 2147483647)
  (let ((linear_search__linear_search__x__assume l))
  (forall ((x__pointer_value us_split_fields))
  (=>
  (= (us_repqtmk2 x__pointer_value) (rec__linear_search__list__pointer_value
                                    linear_search__linear_search__x__assume))
  (forall ((x__pointer_address Int))
  (=>
  (= x__pointer_address (rec__linear_search__list__pointer_address
                        linear_search__linear_search__x__assume))
  (forall ((x__is_null_pointer Bool))
  (=>
  (= x__is_null_pointer (rec__linear_search__list__is_null_pointer
                        linear_search__linear_search__x__assume))
  (=>
  (=> (not (= x__is_null_pointer true)) (dynamic_invariant4
  (rec__linear_search__list__pointer_value
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk2 x__pointer_value)))) true false true true))
  (forall ((i Int))
  (=> (= i 1)
  (=> (dynamic_invariant1 i true false true true)
  (=>
  (= (not (bool_eq
          (us_repqtmk x__is_null_pointer x__pointer_address
          (us_close (us_repqtmk2 x__pointer_value))) us_null_pointer1)) true)
  (let ((o (us_repqtmk x__is_null_pointer x__pointer_address
           (us_close (us_repqtmk2 x__pointer_value)))))
  (let ((o1 (length o)))
  (=>
  (and (dynamic_invariant2 o1 true false true true)
  (= o1 (ite (= (bool_eq o us_null_pointer1) true) 0
        (+ (min 2147483646
           (length
           (rec__linear_search__list_cell__next
           (us_split_fields1 (rec__linear_search__list__pointer_value o))))) 1))))
  (in_range1
  (- (length
     (us_repqtmk x__is_null_pointer x__pointer_address
     (us_close (us_repqtmk2 x__pointer_value)))) o1))))))))))))))))))))))
(check-sat)
(exit)
