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

(declare-sort us_main_type 0)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__binary_search__tree_acc__is_null_pointer Bool)(rec__binary_search__tree_acc__pointer_address Int)(rec__binary_search__tree_acc__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__binary_search__tree_acc__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__binary_search__tree_acc__is_null_pointer a))

(define-fun us_rep_rec__binary_search__tree_acc__pointer_address__projection ((a us_rep)) Int 
  (rec__binary_search__tree_acc__pointer_address a))

(define-fun us_rep_rec__binary_search__tree_acc__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__binary_search__tree_acc__pointer_value_abstr a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__binary_search__tree_acc__is_null_pointer a) 
                        (rec__binary_search__tree_acc__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__binary_search__tree_acc__is_null_pointer a) true))
                        (and
                        (= (rec__binary_search__tree_acc__pointer_address a) 
                        (rec__binary_search__tree_acc__pointer_address b))
                        (= (rec__binary_search__tree_acc__pointer_value_abstr
                           a) (rec__binary_search__tree_acc__pointer_value_abstr
                              b)))))
                   true false))

(declare-const dummy1 us_rep)

(declare-datatypes ((t2b__ref 0))
(((t2b__refqtmk (t2b__content us_rep)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) us_rep (t2b__content
                                                                    a))

(declare-fun m_contains (us_rep Int) Bool)

(declare-fun m_contains__function_guard (Bool us_rep Int) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((tree_acc__ref 0))
(((tree_acc__refqtmk (tree_acc__content us_rep)))))
(define-fun tree_acc__ref_tree_acc__content__projection ((a tree_acc__ref)) us_rep 
  (tree_acc__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__binary_search__tree__data integer)(rec__binary_search__tree__left us_rep)(rec__binary_search__tree__right us_rep)))))
(define-fun us_split_fields_rec__binary_search__tree__data__projection ((a us_split_fields)) integer 
  (rec__binary_search__tree__data a))

(define-fun us_split_fields_rec__binary_search__tree__left__projection ((a us_split_fields)) us_rep 
  (rec__binary_search__tree__left a))

(define-fun us_split_fields_rec__binary_search__tree__right__projection ((a us_split_fields)) us_rep 
  (rec__binary_search__tree__right a))

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
                         (and
                         (= (to_rep
                            (rec__binary_search__tree__data
                            (us_split_fields1 a))) (to_rep
                                                   (rec__binary_search__tree__data
                                                   (us_split_fields1 b))))
                         (= (bool_eq
                            (rec__binary_search__tree__left
                            (us_split_fields1 a))
                            (rec__binary_search__tree__left
                            (us_split_fields1 b))) true))
                         (= (bool_eq
                            (rec__binary_search__tree__right
                            (us_split_fields1 a))
                            (rec__binary_search__tree__right
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

(declare-const binary_search__tree__data__first__bit Int)

(declare-const binary_search__tree__data__last__bit Int)

(declare-const binary_search__tree__data__position Int)

;; binary_search__tree__data__first__bit_axiom
  (assert (<= 0 binary_search__tree__data__first__bit))

;; binary_search__tree__data__last__bit_axiom
  (assert
  (< binary_search__tree__data__first__bit binary_search__tree__data__last__bit))

;; binary_search__tree__data__position_axiom
  (assert (<= 0 binary_search__tree__data__position))

(declare-const binary_search__tree__left__first__bit Int)

(declare-const binary_search__tree__left__last__bit Int)

(declare-const binary_search__tree__left__position Int)

;; binary_search__tree__left__first__bit_axiom
  (assert (<= 0 binary_search__tree__left__first__bit))

;; binary_search__tree__left__last__bit_axiom
  (assert
  (< binary_search__tree__left__first__bit binary_search__tree__left__last__bit))

;; binary_search__tree__left__position_axiom
  (assert (<= 0 binary_search__tree__left__position))

(declare-const binary_search__tree__right__first__bit Int)

(declare-const binary_search__tree__right__last__bit Int)

(declare-const binary_search__tree__right__position Int)

;; binary_search__tree__right__first__bit_axiom
  (assert (<= 0 binary_search__tree__right__first__bit))

;; binary_search__tree__right__last__bit_axiom
  (assert
  (< binary_search__tree__right__first__bit binary_search__tree__right__last__bit))

;; binary_search__tree__right__position_axiom
  (assert (<= 0 binary_search__tree__right__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((tree__ref 0))
(((tree__refqtmk (tree__content us_rep1)))))
(define-fun tree__ref_tree__content__projection ((a tree__ref)) us_rep1 
  (tree__content a))

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

(define-fun rec__binary_search__tree_acc__pointer_value ((a us_rep)) us_rep1 
  (us_open (rec__binary_search__tree_acc__pointer_value_abstr a)))

(define-fun rec__binary_search__tree_acc__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__binary_search__tree_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__binary_search__tree_acc__is_null_pointer us_null_pointer) true))

;; m_contains__def_axiom
  (assert
  (forall ((t us_rep))
  (forall ((v Int))
  (! (= (= (m_contains t v) true)
     (and (not (= (bool_eq t us_null_pointer) true))
     (or
     (or
     (= v (to_rep
          (rec__binary_search__tree__data
          (us_split_fields1 (rec__binary_search__tree_acc__pointer_value t)))))
     (= (m_contains
        (rec__binary_search__tree__left
        (us_split_fields1 (rec__binary_search__tree_acc__pointer_value t)))
        v) true))
     (= (m_contains
        (rec__binary_search__tree__right
        (us_split_fields1 (rec__binary_search__tree_acc__pointer_value t)))
        v) true)))) :pattern ((m_contains t v)) ))))

(declare-const v Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const dummy4 us_rep)

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content us_rep)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) us_rep (t3b__content
                                                                    a))

(declare-const t us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun olt (Int us_rep) Bool)

(declare-fun olt__function_guard (Bool Int us_rep) Bool)

(define-fun default_initial_assumption ((temp___expr_212 us_rep)
  (temp___skip_top_level_213 Bool)) Bool (= (rec__binary_search__tree_acc__is_null_pointer
                                            temp___expr_212) true))

(define-fun default_initial_assumption1 ((temp___expr_219 us_rep1)
  (temp___skip_top_level_220 Bool)) Bool (and
                                         (= (rec__binary_search__tree_acc__is_null_pointer
                                            (rec__binary_search__tree__left
                                            (us_split_fields1
                                            temp___expr_219))) true)
                                         (= (rec__binary_search__tree_acc__is_null_pointer
                                            (rec__binary_search__tree__right
                                            (us_split_fields1
                                            temp___expr_219))) true)))

;; m_contains__post_axiom
  (assert true)

(assert
;; defqtvc
 ;; File "binary_search.adb", line 26, characters 0-0
  (not
  (forall ((binary_search__Olt__result Bool))
  (=> (dynamic_invariant v true false true true)
  (=>
  (exists ((spark__branch Bool))
  (and (= spark__branch (bool_eq t us_null_pointer))
  (ite (= spark__branch true) (= binary_search__Olt__result (distinct 1 0))
  (and
  (forall ((i Int))
  (=> (and (<= (- 2147483648) i) (<= i 2147483647))
  (=>
  (= (m_contains
     (rec__binary_search__tree__left
     (us_split_fields1 (rec__binary_search__tree_acc__pointer_value t))) i) true)
  (= (m_contains t i) true))))
  (and
  (forall ((i Int))
  (=> (and (<= (- 2147483648) i) (<= i 2147483647))
  (=>
  (= (m_contains
     (rec__binary_search__tree__right
     (us_split_fields1 (rec__binary_search__tree_acc__pointer_value t))) i) true)
  (= (m_contains t i) true))))
  (let ((o (rec__binary_search__tree__right
           (us_split_fields1 (rec__binary_search__tree_acc__pointer_value t)))))
  (let ((o1 v))
  (let ((o2 (olt o1 o)))
  (and
  (and
  (= (= o2 true)
  (forall ((i Int))
  (=> (and (<= (- 2147483648) i) (<= i 2147483647))
  (=> (= (m_contains o i) true) (< o1 i)))))
  (= (= o2 true)
  (or (= (bool_eq o us_null_pointer) true)
  (and
  (and
  (< o1 (to_rep
        (rec__binary_search__tree__data
        (us_split_fields1 (rec__binary_search__tree_acc__pointer_value o)))))
  (= (olt o1
     (rec__binary_search__tree__left
     (us_split_fields1 (rec__binary_search__tree_acc__pointer_value o)))) true))
  (= (olt o1
     (rec__binary_search__tree__right
     (us_split_fields1 (rec__binary_search__tree_acc__pointer_value o)))) true)))))
  (let ((o3 (rec__binary_search__tree__left
            (us_split_fields1
            (rec__binary_search__tree_acc__pointer_value t)))))
  (let ((o4 v))
  (let ((o5 (olt o4 o3)))
  (and
  (and
  (= (= o5 true)
  (forall ((i Int))
  (=> (and (<= (- 2147483648) i) (<= i 2147483647))
  (=> (= (m_contains o3 i) true) (< o4 i)))))
  (= (= o5 true)
  (or (= (bool_eq o3 us_null_pointer) true)
  (and
  (and
  (< o4 (to_rep
        (rec__binary_search__tree__data
        (us_split_fields1 (rec__binary_search__tree_acc__pointer_value o3)))))
  (= (olt o4
     (rec__binary_search__tree__left
     (us_split_fields1 (rec__binary_search__tree_acc__pointer_value o3)))) true))
  (= (olt o4
     (rec__binary_search__tree__right
     (us_split_fields1 (rec__binary_search__tree_acc__pointer_value o3)))) true)))))
  (exists ((o6 Int))
  (and
  (= (to_rep
     (rec__binary_search__tree__data
     (us_split_fields1 (rec__binary_search__tree_acc__pointer_value t)))) o6)
  (= binary_search__Olt__result (and (and (ite (< v o6) true false) o5) o2)))))))))))))))))
  (=> (not (= (bool_eq t us_null_pointer) true))
  (rec__binary_search__tree_acc__pointer_value__pred t)))))))
(check-sat)
(exit)
