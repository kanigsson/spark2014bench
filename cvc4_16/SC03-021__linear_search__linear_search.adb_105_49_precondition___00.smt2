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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

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

(declare-const dummy3 us_rep)

(declare-datatypes ((t2b__ref 0))
(((t2b__refqtmk (t2b__content us_rep)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) us_rep (t2b__content
                                                                    a))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

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

(define-fun dynamic_invariant2 ((temp___expr_214 us_rep)
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

(define-fun dynamic_invariant3 ((temp___expr_227 us_rep2)
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
     (dynamic_invariant3 (rec__linear_search__list__pointer_value l) true
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

(define-fun dynamic_invariant4 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

;; nth__def_axiom
  (assert
  (forall ((l us_rep))
  (forall ((n Int))
  (! (=>
     (and
     (=> (not (= (rec__linear_search__list__is_null_pointer l) true))
     (dynamic_invariant3 (rec__linear_search__list__pointer_value l) true
     false true true)) (dynamic_invariant4 n true true true true))
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

(declare-sort us_main_type1 0)

(declare-fun us_main_eq (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep3 0)

(declare-fun bool_eq3 (us_rep3 us_rep3) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq4 (us_rep3 us_rep3) Bool)

(declare-const dummy8 us_rep3)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep3)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep3 
  (sequence__content a))

(declare-fun get (us_rep3 Int) Int)

(declare-fun get__function_guard (Int us_rep3 Int) Bool)

(declare-fun length1 (us_rep3) Int)

(declare-fun length__function_guard1 (Int us_rep3) Bool)

(define-fun last ((container us_rep3)) Int (+ 0 (length1 container)))

(declare-fun last__function_guard (Int us_rep3) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= (- 2147483648) (element_typeqtint i))
  (<= (element_typeqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (element_type element_type) Bool)

(declare-const dummy9 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant5 ((temp___expr_243 Int)
  (temp___is_init_239 Bool) (temp___skip_constant_240 Bool)
  (temp___do_toplevel_241 Bool)
  (temp___do_typ_inv_242 Bool)) Bool (=>
                                     (or (= temp___is_init_239 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range4 temp___expr_243)))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i))
  (<= (extended_indexqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (extended_index extended_index) Bool)

(declare-const dummy10 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant6 ((temp___expr_250 Int)
  (temp___is_init_246 Bool) (temp___skip_constant_247 Bool)
  (temp___do_toplevel_248 Bool)
  (temp___do_typ_inv_249 Bool)) Bool (=>
                                     (or (= temp___is_init_246 true)
                                     (<= 0 2147483647)) (in_range5
                                     temp___expr_250)))

(define-fun length2 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun oeq ((left us_rep3)
  (right us_rep3)) Bool (and (= (length1 left) (length1 right)) (ite 
                                                                (forall
                                                                ((n Int))
                                                                (=>
                                                                (and (<= 1 n)
                                                                (<= n 
                                                                (last left)))
                                                                (= (get left
                                                                   n) 
                                                                (get right n))))
                                                                true false)))

(declare-fun oeq__function_guard (Bool us_rep3 us_rep3) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep3) (b us_rep3))
  (! (= (user_eq4 a b) (oeq a b)) :pattern ((user_eq4 a b)) )))

(define-fun default_initial_assumption2 ((temp___expr_258 us_rep3)
  (temp___skip_top_level_259 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_259 true))
                                         (= (length1 temp___expr_258) 0)))

;; get__post_axiom
  (assert
  (forall ((container us_rep3))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant6 position true true true true)
     (and (<= 1 position) (<= position (last container))))
     (dynamic_invariant5 (get container position) true false true true)) :pattern (
  (get container position)) ))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq7 (us_rep3 us_rep3) Bool)

(declare-const dummy11 us_rep3)

(declare-datatypes ((int_seq__ref 0))
(((int_seq__refqtmk (int_seq__content us_rep3)))))
(define-fun int_seq__ref_int_seq__content__projection ((a int_seq__ref)) us_rep3 
  (int_seq__content a))

(declare-const dummy12 us_rep)

(declare-datatypes ((t85b__ref 0))
(((t85b__refqtmk (t85b__content us_rep)))))
(define-fun t85b__ref_t85b__content__projection ((a t85b__ref)) us_rep 
  (t85b__content a))

(declare-fun all_data (us_rep) us_rep3)

(declare-fun all_data__function_guard (us_rep3 us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep3) (b us_rep3))
  (! (= (user_eq7 a b) (oeq a b)) :pattern ((user_eq7 a b)) )))

(define-fun default_initial_assumption3 ((temp___expr_273 us_rep3)
  (temp___skip_top_level_274 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_274 true))
                                         (= (length1 temp___expr_273) 0)))

;; all_data__post_axiom
  (assert
  (forall ((r us_rep))
  (! (=>
     (=> (not (= (rec__linear_search__list__is_null_pointer r) true))
     (dynamic_invariant3 (rec__linear_search__list__pointer_value r) true
     false true true))
     (let ((result (all_data r)))
     (and (= (last result) (length r))
     (forall ((n Int))
     (=> (and (<= 1 n) (<= n (length r))) (= (get result n) (nth r n))))))) :pattern (
  (all_data r)) )))

(declare-const dummy13 us_rep)

(declare-datatypes ((t96b__ref 0))
(((t96b__refqtmk (t96b__content us_rep)))))
(define-fun t96b__ref_t96b__content__projection ((a t96b__ref)) us_rep 
  (t96b__content a))

(declare-const l us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const v Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const dummy14 us_rep1)

(declare-datatypes ((t97b__ref 0))
(((t97b__refqtmk (t97b__content us_rep1)))))
(define-fun t97b__ref_t97b__content__projection ((a t97b__ref)) us_rep1 
  (t97b__content a))

(declare-fun linear_search (us_rep Int) us_rep1)

(declare-fun linear_search__function_guard (us_rep1 us_rep Int) Bool)

(declare-sort us_pledge_ty 0)

(declare-datatypes ((us_pledge_ty__ref 0))
(((us_pledge_ty__refqtmk (us_pledge_ty__content us_pledge_ty)))))
(declare-fun us_pledge_get (us_pledge_ty us_rep us_rep1) Bool)

(declare-fun linear_search__linear_search__2__pledge (us_rep
  Int) us_pledge_ty)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const o us_rep3)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const dummy15 us_rep)

(declare-datatypes ((t107b__ref 0))
(((t107b__refqtmk (t107b__content us_rep)))))
(define-fun t107b__ref_t107b__content__projection ((a t107b__ref)) us_rep 
  (t107b__content a))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort us_pledge_ty1 0)

(declare-datatypes ((us_pledge_ty__ref1 0))
(((us_pledge_ty__refqtmk1 (us_pledge_ty__content1 us_pledge_ty1)))))
(declare-fun us_pledge_get1 (us_pledge_ty1 us_rep us_rep) Bool)

(declare-const dummy16 us_rep1)

(declare-datatypes ((int_acc__ref 0))
(((int_acc__refqtmk (int_acc__content us_rep1)))))
(define-fun int_acc__ref_int_acc__content__projection ((a int_acc__ref)) us_rep1 
  (int_acc__content a))

(define-fun default_initial_assumption4 ((temp___expr_208 us_rep1)
  (temp___skip_top_level_209 Bool)) Bool (= (rec__linear_search__int_acc__is_null_pointer
                                            temp___expr_208) true))

;; length__post_axiom
  (assert
  (forall ((l1 us_rep))
  (! (=>
     (=> (not (= (rec__linear_search__list__is_null_pointer l1) true))
     (dynamic_invariant3 (rec__linear_search__list__pointer_value l1) true
     false true true)) (dynamic_invariant1 (length l1) true false true true)) :pattern (
  (length l1)) )))

;; nth__post_axiom
  (assert
  (forall ((l1 us_rep))
  (forall ((n Int))
  (! (=>
     (and
     (and
     (=> (not (= (rec__linear_search__list__is_null_pointer l1) true))
     (dynamic_invariant3 (rec__linear_search__list__pointer_value l1) true
     false true true)) (dynamic_invariant4 n true true true true))
     (<= n (length l1))) (dynamic_invariant (nth l1 n) true false true true)) :pattern (
  (nth l1 n)) ))))

;; o__def_axiom
  (assert (= o (all_data l)))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq8 (count_type count_type) Bool)

(declare-const dummy17 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant7 ((temp___expr_265 Int)
  (temp___is_init_261 Bool) (temp___skip_constant_262 Bool)
  (temp___do_toplevel_263 Bool)
  (temp___do_typ_inv_264 Bool)) Bool (=>
                                     (or (= temp___is_init_261 true)
                                     (<= 0 2147483647)) (in_range6
                                     temp___expr_265)))

;; length__post_axiom
  (assert
  (forall ((container us_rep3))
  (! (let ((result (length1 container)))
     (and (<= (+ 0 result) 2147483647) (dynamic_invariant7 result true false
     true true))) :pattern ((length1 container)) )))

(assert
;; defqtvc
 ;; File "linear_search.adb", line 82, characters 0-0
  (not
  (=>
  (=> (not (= (rec__linear_search__list__is_null_pointer l) true))
  (dynamic_invariant3 (rec__linear_search__list__pointer_value l) true false
  true true))
  (=> (dynamic_invariant v true false true true)
  (=> (< (length l) 2147483647)
  (forall ((i Int))
  (=> (= i 0)
  (=> (dynamic_invariant1 i true false true true)
  (let ((o1 l))
  (let ((linear_search__linear_search__2__o__assume (all_data o1)))
  (=>
  (and (= (last linear_search__linear_search__2__o__assume) (length o1))
  (forall ((n Int))
  (=> (and (<= 1 n) (<= n (length o1)))
  (= (get linear_search__linear_search__2__o__assume n) (nth o1 n)))))
  (=> (= linear_search__linear_search__2__o__assume o)
  (let ((linear_search__linear_search__2__x__assume l))
  (forall ((usf us_pledge_ty1))
  (=>
  (forall ((temp___borrowed_309 us_rep))
  (forall ((temp___brower_308 us_rep))
  (! (= (= (us_pledge_get1 usf temp___borrowed_309 temp___brower_308) true)
     (= temp___brower_308 temp___borrowed_309)) :pattern ((us_pledge_get1 usf
                                                          temp___borrowed_309
                                                          temp___brower_308)) )))
  (forall ((linear_search__linear_search__2__x__pledge us_pledge_ty1))
  (=> (= linear_search__linear_search__2__x__pledge usf)
  (forall ((x__pointer_value us_split_fields))
  (=>
  (= (us_repqtmk2 x__pointer_value) (rec__linear_search__list__pointer_value
                                    linear_search__linear_search__2__x__assume))
  (forall ((x__pointer_address Int))
  (=>
  (= x__pointer_address (rec__linear_search__list__pointer_address
                        linear_search__linear_search__2__x__assume))
  (forall ((x__is_null_pointer Bool))
  (=>
  (= x__is_null_pointer (rec__linear_search__list__is_null_pointer
                        linear_search__linear_search__2__x__assume))
  (=>
  (=> (not (= x__is_null_pointer true)) (dynamic_invariant3
  (rec__linear_search__list__pointer_value
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk2 x__pointer_value)))) true false true true))
  (=>
  (= (not (bool_eq
          (us_repqtmk x__is_null_pointer x__pointer_address
          (us_close (us_repqtmk2 x__pointer_value))) us_null_pointer1)) true)
  (let ((o2 (us_repqtmk x__is_null_pointer x__pointer_address
            (us_close (us_repqtmk2 x__pointer_value)))))
  (let ((o3 (length o2)))
  (=>
  (and (dynamic_invariant1 o3 true false true true)
  (= o3 (ite (= (bool_eq o2 us_null_pointer1) true) 0
        (+ (min 2147483646
           (length
           (rec__linear_search__list_cell__next
           (us_split_fields1 (rec__linear_search__list__pointer_value o2))))) 1))))
  (=> (in_range1
  (- (length
     (us_repqtmk x__is_null_pointer x__pointer_address
     (us_close (us_repqtmk2 x__pointer_value)))) o3))
  (forall ((usf1 Int))
  (let ((o4 l))
  (let ((o5 (length o4)))
  (=>
  (and (dynamic_invariant1 o5 true false true true)
  (= o5 (ite (= (bool_eq o4 us_null_pointer1) true) 0
        (+ (min 2147483646
           (length
           (rec__linear_search__list_cell__next
           (us_split_fields1 (rec__linear_search__list__pointer_value o4))))) 1))))
  (let ((o6 (+ i 1)))
  (=> (in_range1 o6)
  (=>
  (= (and (ite (<= o6 usf1) true false) (ite (<= usf1 o5) true false)) true)
  (=> (in_range3 usf1)
  (let ((o7 l))
  (let ((o8 (nth o7 usf1)))
  (=>
  (and (dynamic_invariant o8 true false true true)
  (= o8 (ite (= usf1 1)
        (to_rep
        (rec__linear_search__int_acc__pointer_value
        (rec__linear_search__list_cell__data
        (us_split_fields1 (rec__linear_search__list__pointer_value o7)))))
        (nth
        (rec__linear_search__list_cell__next
        (us_split_fields1 (rec__linear_search__list__pointer_value o7)))
        (- usf1 1)))))
  (let ((o9 (- usf1 i)))
  (=> (in_range1 o9)
  (=> (in_range3 o9)
  (<= o9 (length
         (us_repqtmk x__is_null_pointer x__pointer_address
         (us_close (us_repqtmk2 x__pointer_value))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
