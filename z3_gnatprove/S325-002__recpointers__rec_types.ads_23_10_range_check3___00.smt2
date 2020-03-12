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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort us_main_type 0)

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (rec__rec_types__test2__tree__is_null_pointer Bool)(rec__rec_types__test2__tree__pointer_address Int)(rec__rec_types__test2__tree__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__rec_types__test2__tree__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__rec_types__test2__tree__is_null_pointer a))

(define-fun us_rep_rec__rec_types__test2__tree__pointer_address__projection ((a us_rep)) Int 
  (rec__rec_types__test2__tree__pointer_address a))

(define-fun us_rep_rec__rec_types__test2__tree__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__rec_types__test2__tree__pointer_value_abstr a))

(declare-datatypes ()
((us_rep__ref (us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__3__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__rec_types__test2__tree__is_null_pointer a) 
                        (rec__rec_types__test2__tree__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__rec_types__test2__tree__is_null_pointer a) true))
                        (and
                        (= (rec__rec_types__test2__tree__pointer_address a) 
                        (rec__rec_types__test2__tree__pointer_address b))
                        (= (rec__rec_types__test2__tree__pointer_value_abstr
                           a) (rec__rec_types__test2__tree__pointer_value_abstr
                              b)))))
                   true false))

(declare-const dummy3 us_rep)

(declare-datatypes () ((tree__ref (tree__refqtmk (tree__content us_rep)))))
(define-fun tree__ref_tree__content__2__projection ((a tree__ref)) us_rep 
  (tree__content a))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int us_rep))))))
(declare-fun slide ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (bool_eq (select a temp___idx_155)
                              (select b (+ (- b__first a__first) temp___idx_155))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (bool_eq (select a temp___idx_155)
     (select b (+ (- b__first a__first) temp___idx_155))) true))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int us_rep))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int us_rep) (elts a))

(define-fun of_array ((a (Array Int us_rep)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq1 (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ()
((tree_array__ref (tree_array__refqtmk (tree_array__content us_t)))))
(define-fun tree_array__ref_tree_array__content__2__projection ((a tree_array__ref)) us_t 
  (tree_array__content a))

(declare-datatypes () ((t6s__ref (t6s__refqtmk (t6s__content us_t)))))
(define-fun t6s__ref_t6s__content__projection ((a t6s__ref)) us_t (t6s__content
                                                                  a))

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__rec_types__test2__tree_node__d natural)))))
(define-fun us_split_discrs_rec__rec_types__test2__tree_node__d__projection ((a us_split_discrs)) natural 
  (rec__rec_types__test2__tree_node__d a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__rec_types__test2__tree_node__val integer)(rec__rec_types__test2__tree_node__next us_t)))))
(define-fun us_split_fields_rec__rec_types__test2__tree_node__val__projection ((a us_split_fields)) integer 
  (rec__rec_types__test2__tree_node__val a))

(define-fun us_split_fields_rec__rec_types__test2__tree_node__next__projection ((a us_split_fields)) us_t 
  (rec__rec_types__test2__tree_node__next a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep1
 (us_repqtmk1
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__rec_types__test2__tree_node__d
                            (us_split_discrs1 a))) (to_rep
                                                   (rec__rec_types__test2__tree_node__d
                                                   (us_split_discrs1 b))))
                         (and
                         (= (to_rep1
                            (rec__rec_types__test2__tree_node__val
                            (us_split_fields1 a))) (to_rep1
                                                   (rec__rec_types__test2__tree_node__val
                                                   (us_split_fields1 b))))
                         (= (bool_eq2
                            (rec__rec_types__test2__tree_node__next
                            (us_split_fields1 a))
                            (rec__rec_types__test2__tree_node__next
                            (us_split_fields1 b))) true)))
                    true false))

(define-fun in_range3 ((rec__rec_types__test2__tree_node__d1 Int)
  (a us_split_discrs)) Bool (= rec__rec_types__test2__tree_node__d1 (to_rep
                                                                    (rec__rec_types__test2__tree_node__d
                                                                    a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const rec_types__test2__tree_node__d__first__bit Int)

(declare-const rec_types__test2__tree_node__d__last__bit Int)

(declare-const rec_types__test2__tree_node__d__position Int)

;; rec_types__test2__tree_node__d__first__bit_axiom
  (assert (<= 0 rec_types__test2__tree_node__d__first__bit))

;; rec_types__test2__tree_node__d__last__bit_axiom
  (assert
  (< rec_types__test2__tree_node__d__first__bit rec_types__test2__tree_node__d__last__bit))

;; rec_types__test2__tree_node__d__position_axiom
  (assert (<= 0 rec_types__test2__tree_node__d__position))

(declare-const rec_types__test2__tree_node__val__first__bit Int)

(declare-const rec_types__test2__tree_node__val__last__bit Int)

(declare-const rec_types__test2__tree_node__val__position Int)

;; rec_types__test2__tree_node__val__first__bit_axiom
  (assert (<= 0 rec_types__test2__tree_node__val__first__bit))

;; rec_types__test2__tree_node__val__last__bit_axiom
  (assert
  (< rec_types__test2__tree_node__val__first__bit rec_types__test2__tree_node__val__last__bit))

;; rec_types__test2__tree_node__val__position_axiom
  (assert (<= 0 rec_types__test2__tree_node__val__position))

(declare-const rec_types__test2__tree_node__next__first__bit Int)

(declare-const rec_types__test2__tree_node__next__last__bit Int)

(declare-const rec_types__test2__tree_node__next__position Int)

;; rec_types__test2__tree_node__next__first__bit_axiom
  (assert (<= 0 rec_types__test2__tree_node__next__first__bit))

;; rec_types__test2__tree_node__next__last__bit_axiom
  (assert
  (< rec_types__test2__tree_node__next__first__bit rec_types__test2__tree_node__next__last__bit))

;; rec_types__test2__tree_node__next__position_axiom
  (assert (<= 0 rec_types__test2__tree_node__next__position))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ()
((tree_node__ref (tree_node__refqtmk (tree_node__content us_rep1)))))
(define-fun tree_node__ref_tree_node__content__2__projection ((a tree_node__ref)) us_rep1 
  (tree_node__content a))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(define-fun in_range4 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Bool)

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

(define-fun rec__rec_types__test2__tree__pointer_value ((a us_rep)) us_rep1 
  (us_open (rec__rec_types__test2__tree__pointer_value_abstr a)))

(define-fun rec__rec_types__test2__tree__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__rec_types__test2__tree__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__rec_types__test2__tree__is_null_pointer us_null_pointer) true))

(declare-fun temp___dynamic_invariant_206 (us_rep Bool Bool Bool Bool) Bool)

(define-fun dynamic_invariant3 ((temp___expr_203 us_rep)
  (temp___is_init_199 Bool) (temp___skip_constant_200 Bool)
  (temp___do_toplevel_201 Bool)
  (temp___do_typ_inv_202 Bool)) Bool (=>
                                     (not
                                     (= (rec__rec_types__test2__tree__is_null_pointer
                                        temp___expr_203) true))
                                     (let ((temp___204 (rec__rec_types__test2__tree_node__d
                                                       (us_split_discrs1
                                                       (rec__rec_types__test2__tree__pointer_value
                                                       temp___expr_203)))))
                                     (and
                                     (and (dynamic_property 1
                                     (to_rep temp___204)
                                     (first1
                                     (rec__rec_types__test2__tree_node__next
                                     (us_split_fields1
                                     (rec__rec_types__test2__tree__pointer_value
                                     temp___expr_203))))
                                     (last1
                                     (rec__rec_types__test2__tree_node__next
                                     (us_split_fields1
                                     (rec__rec_types__test2__tree__pointer_value
                                     temp___expr_203)))))
                                     (and
                                     (= (first1
                                        (rec__rec_types__test2__tree_node__next
                                        (us_split_fields1
                                        (rec__rec_types__test2__tree__pointer_value
                                        temp___expr_203)))) 1)
                                     (= (last1
                                        (rec__rec_types__test2__tree_node__next
                                        (us_split_fields1
                                        (rec__rec_types__test2__tree__pointer_value
                                        temp___expr_203)))) (to_rep
                                                            temp___204))))
                                     (forall ((temp___205 Int))
                                     (=>
                                     (and
                                     (<= (first1
                                         (rec__rec_types__test2__tree_node__next
                                         (us_split_fields1
                                         (rec__rec_types__test2__tree__pointer_value
                                         temp___expr_203)))) temp___205)
                                     (<= temp___205 (last1
                                                    (rec__rec_types__test2__tree_node__next
                                                    (us_split_fields1
                                                    (rec__rec_types__test2__tree__pointer_value
                                                    temp___expr_203))))))
                                     (temp___dynamic_invariant_206
                                     (select (to_array
                                             (rec__rec_types__test2__tree_node__next
                                             (us_split_fields1
                                             (rec__rec_types__test2__tree__pointer_value
                                             temp___expr_203)))) temp___205)
                                     true false true temp___do_typ_inv_202)))))))

;; def_axiom
  (assert
  (forall ((temp___expr_211 us_rep))
  (forall ((temp___is_init_207 Bool) (temp___skip_constant_208 Bool)
  (temp___do_toplevel_209 Bool) (temp___do_typ_inv_210 Bool))
  (! (= (temp___dynamic_invariant_206 temp___expr_211 temp___is_init_207
     temp___skip_constant_208 temp___do_toplevel_209 temp___do_typ_inv_210)
     (=>
     (not
     (= (rec__rec_types__test2__tree__is_null_pointer temp___expr_211) true))
     (let ((temp___212 (rec__rec_types__test2__tree_node__d
                       (us_split_discrs1
                       (rec__rec_types__test2__tree__pointer_value
                       temp___expr_211)))))
     (and
     (and (dynamic_property 1 (to_rep temp___212)
     (first1
     (rec__rec_types__test2__tree_node__next
     (us_split_fields1
     (rec__rec_types__test2__tree__pointer_value temp___expr_211))))
     (last1
     (rec__rec_types__test2__tree_node__next
     (us_split_fields1
     (rec__rec_types__test2__tree__pointer_value temp___expr_211)))))
     (and
     (= (first1
        (rec__rec_types__test2__tree_node__next
        (us_split_fields1
        (rec__rec_types__test2__tree__pointer_value temp___expr_211)))) 1)
     (= (last1
        (rec__rec_types__test2__tree_node__next
        (us_split_fields1
        (rec__rec_types__test2__tree__pointer_value temp___expr_211)))) 
     (to_rep temp___212))))
     (forall ((temp___213 Int))
     (=>
     (and
     (<= (first1
         (rec__rec_types__test2__tree_node__next
         (us_split_fields1
         (rec__rec_types__test2__tree__pointer_value temp___expr_211)))) temp___213)
     (<= temp___213 (last1
                    (rec__rec_types__test2__tree_node__next
                    (us_split_fields1
                    (rec__rec_types__test2__tree__pointer_value
                    temp___expr_211))))))
     (temp___dynamic_invariant_206
     (select (to_array
             (rec__rec_types__test2__tree_node__next
             (us_split_fields1
             (rec__rec_types__test2__tree__pointer_value temp___expr_211)))) temp___213)
     true false true temp___do_typ_inv_210))))))) :pattern ((temp___dynamic_invariant_206
  temp___expr_211 temp___is_init_207 temp___skip_constant_208
  temp___do_toplevel_209 temp___do_typ_inv_210)) ))))

(define-fun default_initial_assumption ((temp___expr_214 us_rep)
  (temp___skip_top_level_215 Bool)) Bool (= (rec__rec_types__test2__tree__is_null_pointer
                                            temp___expr_214) true))

(define-fun dynamic_invariant4 ((temp___expr_228 us_rep1)
  (temp___is_init_224 Bool) (temp___skip_constant_225 Bool)
  (temp___do_toplevel_226 Bool)
  (temp___do_typ_inv_227 Bool)) Bool (let ((temp___229 (rec__rec_types__test2__tree_node__d
                                                       (us_split_discrs1
                                                       temp___expr_228))))
                                     (and
                                     (and (dynamic_property 1
                                     (to_rep temp___229)
                                     (first1
                                     (rec__rec_types__test2__tree_node__next
                                     (us_split_fields1 temp___expr_228)))
                                     (last1
                                     (rec__rec_types__test2__tree_node__next
                                     (us_split_fields1 temp___expr_228))))
                                     (and
                                     (= (first1
                                        (rec__rec_types__test2__tree_node__next
                                        (us_split_fields1 temp___expr_228))) 1)
                                     (= (last1
                                        (rec__rec_types__test2__tree_node__next
                                        (us_split_fields1 temp___expr_228))) 
                                     (to_rep temp___229))))
                                     (forall ((temp___230 Int))
                                     (=>
                                     (and
                                     (<= (first1
                                         (rec__rec_types__test2__tree_node__next
                                         (us_split_fields1 temp___expr_228))) temp___230)
                                     (<= temp___230 (last1
                                                    (rec__rec_types__test2__tree_node__next
                                                    (us_split_fields1
                                                    temp___expr_228)))))
                                     (=>
                                     (not
                                     (= (rec__rec_types__test2__tree__is_null_pointer
                                        (select (to_array
                                                (rec__rec_types__test2__tree_node__next
                                                (us_split_fields1
                                                temp___expr_228))) temp___230)) true))
                                     (let ((temp___231 (rec__rec_types__test2__tree_node__d
                                                       (us_split_discrs1
                                                       (rec__rec_types__test2__tree__pointer_value
                                                       (select (to_array
                                                               (rec__rec_types__test2__tree_node__next
                                                               (us_split_fields1
                                                               temp___expr_228))) temp___230))))))
                                     (and
                                     (and (dynamic_property 1
                                     (to_rep temp___231)
                                     (first1
                                     (rec__rec_types__test2__tree_node__next
                                     (us_split_fields1
                                     (rec__rec_types__test2__tree__pointer_value
                                     (select (to_array
                                             (rec__rec_types__test2__tree_node__next
                                             (us_split_fields1
                                             temp___expr_228))) temp___230)))))
                                     (last1
                                     (rec__rec_types__test2__tree_node__next
                                     (us_split_fields1
                                     (rec__rec_types__test2__tree__pointer_value
                                     (select (to_array
                                             (rec__rec_types__test2__tree_node__next
                                             (us_split_fields1
                                             temp___expr_228))) temp___230))))))
                                     (and
                                     (= (first1
                                        (rec__rec_types__test2__tree_node__next
                                        (us_split_fields1
                                        (rec__rec_types__test2__tree__pointer_value
                                        (select (to_array
                                                (rec__rec_types__test2__tree_node__next
                                                (us_split_fields1
                                                temp___expr_228))) temp___230))))) 1)
                                     (= (last1
                                        (rec__rec_types__test2__tree_node__next
                                        (us_split_fields1
                                        (rec__rec_types__test2__tree__pointer_value
                                        (select (to_array
                                                (rec__rec_types__test2__tree_node__next
                                                (us_split_fields1
                                                temp___expr_228))) temp___230))))) 
                                     (to_rep temp___231))))
                                     (forall ((temp___232 Int))
                                     (=>
                                     (and
                                     (<= (first1
                                         (rec__rec_types__test2__tree_node__next
                                         (us_split_fields1
                                         (rec__rec_types__test2__tree__pointer_value
                                         (select (to_array
                                                 (rec__rec_types__test2__tree_node__next
                                                 (us_split_fields1
                                                 temp___expr_228))) temp___230))))) temp___232)
                                     (<= temp___232 (last1
                                                    (rec__rec_types__test2__tree_node__next
                                                    (us_split_fields1
                                                    (rec__rec_types__test2__tree__pointer_value
                                                    (select (to_array
                                                            (rec__rec_types__test2__tree_node__next
                                                            (us_split_fields1
                                                            temp___expr_228))) temp___230)))))))
                                     (temp___dynamic_invariant_206
                                     (select (to_array
                                             (rec__rec_types__test2__tree_node__next
                                             (us_split_fields1
                                             (rec__rec_types__test2__tree__pointer_value
                                             (select (to_array
                                                     (rec__rec_types__test2__tree_node__next
                                                     (us_split_fields1
                                                     temp___expr_228))) temp___230))))) temp___232)
                                     true false true temp___do_typ_inv_227)))))))))))

(declare-const usf Int)

;; Ensures
  (assert (dynamic_invariant usf true true true true))

(declare-const usf1 us_rep1)

;; Ensures
  (assert
  (= (to_rep (rec__rec_types__test2__tree_node__d (us_split_discrs1 usf1))) 
  usf))

;; H
  (assert (<= 1 usf))

(assert
;; defqtvc
 ;; File "rec_types.ads", line 16, characters 0-0
  (not (<= 1 1)))
(check-sat)
