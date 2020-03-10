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

(declare-sort red_or_black 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (red_or_black red_or_black) Bool)

(declare-const dummy1 red_or_black)

(declare-datatypes ((red_or_black__ref 0))
(((red_or_black__refqtmk (red_or_black__content red_or_black)))))
(define-fun red_or_black__ref_red_or_black__content__projection ((a red_or_black__ref)) red_or_black 
  (red_or_black__content a))

(declare-fun to_rep1 (red_or_black) Int)

(declare-fun of_rep1 (Int) red_or_black)

;; inversion_axiom
  (assert
  (forall ((x red_or_black))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x red_or_black)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort us_main_type 0)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__red_black_trees__tree__is_null_pointer Bool)(rec__red_black_trees__tree__pointer_address Int)(rec__red_black_trees__tree__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__red_black_trees__tree__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__red_black_trees__tree__is_null_pointer a))

(define-fun us_rep_rec__red_black_trees__tree__pointer_address__projection ((a us_rep)) Int 
  (rec__red_black_trees__tree__pointer_address a))

(define-fun us_rep_rec__red_black_trees__tree__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__red_black_trees__tree__pointer_value_abstr a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__red_black_trees__tree__is_null_pointer a) 
                        (rec__red_black_trees__tree__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__red_black_trees__tree__is_null_pointer a) true))
                        (and
                        (= (rec__red_black_trees__tree__pointer_address a) 
                        (rec__red_black_trees__tree__pointer_address b))
                        (= (rec__red_black_trees__tree__pointer_value_abstr
                           a) (rec__red_black_trees__tree__pointer_value_abstr
                              b)))))
                   true false))

(declare-const dummy2 us_rep)

(declare-datatypes ((tree__ref 0))
(((tree__refqtmk (tree__content us_rep)))))
(define-fun tree__ref_tree__content__projection ((a tree__ref)) us_rep 
  (tree__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__red_black_trees__tree_cell__value integer)(rec__red_black_trees__tree_cell__color red_or_black)(rec__red_black_trees__tree_cell__left us_rep)(rec__red_black_trees__tree_cell__right us_rep)))))
(define-fun us_split_fields_rec__red_black_trees__tree_cell__value__projection ((a us_split_fields)) integer 
  (rec__red_black_trees__tree_cell__value a))

(define-fun us_split_fields_rec__red_black_trees__tree_cell__color__projection ((a us_split_fields)) red_or_black 
  (rec__red_black_trees__tree_cell__color a))

(define-fun us_split_fields_rec__red_black_trees__tree_cell__left__projection ((a us_split_fields)) us_rep 
  (rec__red_black_trees__tree_cell__left a))

(define-fun us_split_fields_rec__red_black_trees__tree_cell__right__projection ((a us_split_fields)) us_rep 
  (rec__red_black_trees__tree_cell__right a))

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
                            (rec__red_black_trees__tree_cell__value
                            (us_split_fields1 a))) (to_rep
                                                   (rec__red_black_trees__tree_cell__value
                                                   (us_split_fields1 b))))
                         (= (to_rep1
                            (rec__red_black_trees__tree_cell__color
                            (us_split_fields1 a))) (to_rep1
                                                   (rec__red_black_trees__tree_cell__color
                                                   (us_split_fields1 b)))))
                         (and
                         (= (bool_eq
                            (rec__red_black_trees__tree_cell__left
                            (us_split_fields1 a))
                            (rec__red_black_trees__tree_cell__left
                            (us_split_fields1 b))) true)
                         (= (bool_eq
                            (rec__red_black_trees__tree_cell__right
                            (us_split_fields1 a))
                            (rec__red_black_trees__tree_cell__right
                            (us_split_fields1 b))) true)))
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

(declare-const red_black_trees__tree_cell__value__first__bit Int)

(declare-const red_black_trees__tree_cell__value__last__bit Int)

(declare-const red_black_trees__tree_cell__value__position Int)

;; red_black_trees__tree_cell__value__first__bit_axiom
  (assert (<= 0 red_black_trees__tree_cell__value__first__bit))

;; red_black_trees__tree_cell__value__last__bit_axiom
  (assert
  (< red_black_trees__tree_cell__value__first__bit red_black_trees__tree_cell__value__last__bit))

;; red_black_trees__tree_cell__value__position_axiom
  (assert (<= 0 red_black_trees__tree_cell__value__position))

(declare-const red_black_trees__tree_cell__color__first__bit Int)

(declare-const red_black_trees__tree_cell__color__last__bit Int)

(declare-const red_black_trees__tree_cell__color__position Int)

;; red_black_trees__tree_cell__color__first__bit_axiom
  (assert (<= 0 red_black_trees__tree_cell__color__first__bit))

;; red_black_trees__tree_cell__color__last__bit_axiom
  (assert
  (< red_black_trees__tree_cell__color__first__bit red_black_trees__tree_cell__color__last__bit))

;; red_black_trees__tree_cell__color__position_axiom
  (assert (<= 0 red_black_trees__tree_cell__color__position))

(declare-const red_black_trees__tree_cell__left__first__bit Int)

(declare-const red_black_trees__tree_cell__left__last__bit Int)

(declare-const red_black_trees__tree_cell__left__position Int)

;; red_black_trees__tree_cell__left__first__bit_axiom
  (assert (<= 0 red_black_trees__tree_cell__left__first__bit))

;; red_black_trees__tree_cell__left__last__bit_axiom
  (assert
  (< red_black_trees__tree_cell__left__first__bit red_black_trees__tree_cell__left__last__bit))

;; red_black_trees__tree_cell__left__position_axiom
  (assert (<= 0 red_black_trees__tree_cell__left__position))

(declare-const red_black_trees__tree_cell__right__first__bit Int)

(declare-const red_black_trees__tree_cell__right__last__bit Int)

(declare-const red_black_trees__tree_cell__right__position Int)

;; red_black_trees__tree_cell__right__first__bit_axiom
  (assert (<= 0 red_black_trees__tree_cell__right__first__bit))

;; red_black_trees__tree_cell__right__last__bit_axiom
  (assert
  (< red_black_trees__tree_cell__right__first__bit red_black_trees__tree_cell__right__last__bit))

;; red_black_trees__tree_cell__right__position_axiom
  (assert (<= 0 red_black_trees__tree_cell__right__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((tree_cell__ref 0))
(((tree_cell__refqtmk (tree_cell__content us_rep1)))))
(define-fun tree_cell__ref_tree_cell__content__projection ((a tree_cell__ref)) us_rep1 
  (tree_cell__content a))

(define-fun default_initial_assumption ((temp___expr_166 us_rep)
  (temp___skip_top_level_167 Bool)) Bool (= (rec__red_black_trees__tree__is_null_pointer
                                            temp___expr_166) true))

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

(define-fun rec__red_black_trees__tree__pointer_value ((a us_rep)) us_rep1 
  (us_open (rec__red_black_trees__tree__pointer_value_abstr a)))

(define-fun rec__red_black_trees__tree__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__red_black_trees__tree__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__red_black_trees__tree__is_null_pointer us_null_pointer) true))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= 0 1)) (in_range2 temp___expr_158)))

(define-fun default_initial_assumption1 ((temp___expr_173 us_rep1)
  (temp___skip_top_level_174 Bool)) Bool (and
                                         (= (rec__red_black_trees__tree__is_null_pointer
                                            (rec__red_black_trees__tree_cell__left
                                            (us_split_fields1
                                            temp___expr_173))) true)
                                         (= (rec__red_black_trees__tree__is_null_pointer
                                            (rec__red_black_trees__tree_cell__right
                                            (us_split_fields1
                                            temp___expr_173))) true)))

(assert
;; defqtvc
 ;; File "red_black_trees.adb", line 19, characters 0-0
  (not
  (forall ((t__pointer_value us_split_fields) (t__pointer_address Int)
  (t__is_null_pointer Bool) (o Bool) (spark__branch Bool) (o1 Bool)
  (spark__branch1 Bool))
  (=>
  (exists ((o2 Int))
  (and
  (= (to_rep1
     (rec__red_black_trees__tree_cell__color
     (us_split_fields1
     (rec__red_black_trees__tree__pointer_value
     (us_repqtmk t__is_null_pointer t__pointer_address
     (us_close (us_repqtmk1 t__pointer_value))))))) o2)
  (ite (= (ite (= o2 1)
          (not (bool_eq
               (rec__red_black_trees__tree_cell__left
               (us_split_fields1
               (rec__red_black_trees__tree__pointer_value
               (us_repqtmk t__is_null_pointer t__pointer_address
               (us_close (us_repqtmk1 t__pointer_value)))))) us_null_pointer))
          false) true)
  (exists ((o3 Int))
  (and
  (= (to_rep1
     (rec__red_black_trees__tree_cell__color
     (us_split_fields1
     (rec__red_black_trees__tree__pointer_value
     (rec__red_black_trees__tree_cell__left
     (us_split_fields1
     (rec__red_black_trees__tree__pointer_value
     (us_repqtmk t__is_null_pointer t__pointer_address
     (us_close (us_repqtmk1 t__pointer_value)))))))))) o3)
  (= o (ite (= o3 0) true false)))) (= o false))))
  (=> (= spark__branch o)
  (=> (= spark__branch true)
  (=>
  (ite (= (not (bool_eq
               (rec__red_black_trees__tree_cell__left
               (us_split_fields1
               (rec__red_black_trees__tree__pointer_value
               (rec__red_black_trees__tree_cell__left
               (us_split_fields1
               (rec__red_black_trees__tree__pointer_value
               (us_repqtmk t__is_null_pointer t__pointer_address
               (us_close (us_repqtmk1 t__pointer_value)))))))))
               us_null_pointer)) true)
  (exists ((o2 Int))
  (and
  (= (to_rep1
     (rec__red_black_trees__tree_cell__color
     (us_split_fields1
     (rec__red_black_trees__tree__pointer_value
     (rec__red_black_trees__tree_cell__left
     (us_split_fields1
     (rec__red_black_trees__tree__pointer_value
     (rec__red_black_trees__tree_cell__left
     (us_split_fields1
     (rec__red_black_trees__tree__pointer_value
     (us_repqtmk t__is_null_pointer t__pointer_address
     (us_close (us_repqtmk1 t__pointer_value))))))))))))) o2)
  (= o1 (ite (= o2 0) true false)))) (= o1 false))
  (=> (= spark__branch1 o1)
  (=> (not (= spark__branch1 true))
  (=>
  (= (not (bool_eq
          (rec__red_black_trees__tree_cell__right
          (us_split_fields1
          (rec__red_black_trees__tree__pointer_value
          (rec__red_black_trees__tree_cell__left
          (us_split_fields1
          (rec__red_black_trees__tree__pointer_value
          (us_repqtmk t__is_null_pointer t__pointer_address
          (us_close (us_repqtmk1 t__pointer_value))))))))) us_null_pointer)) true)
  (rec__red_black_trees__tree__pointer_value__pred
  (rec__red_black_trees__tree_cell__left
  (us_split_fields1
  (rec__red_black_trees__tree__pointer_value
  (us_repqtmk t__is_null_pointer t__pointer_address
  (us_close (us_repqtmk1 t__pointer_value)))))))))))))))))
(check-sat)
(exit)
