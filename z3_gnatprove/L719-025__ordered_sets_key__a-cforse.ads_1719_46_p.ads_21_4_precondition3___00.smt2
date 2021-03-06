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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-fun my_inf (Int Int) Bool)

(declare-fun my_inf__function_guard (Bool Int Int) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= 1 (element_typeqtint i)) (<= (element_typeqtint i) 100))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (element_type element_type) Bool)

(declare-const dummy element_type)

(declare-datatypes ()
((element_type__ref
 (element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant ((temp___expr_286 Int)
  (temp___is_init_282 Bool) (temp___skip_constant_283 Bool)
  (temp___do_toplevel_284 Bool)
  (temp___do_typ_inv_285 Bool)) Bool (=>
                                     (or (= temp___is_init_282 true)
                                     (<= 1 100)) (in_range1 temp___expr_286)))

;; my_inf__post_axiom
  (assert true)

;; my_inf__def_axiom
  (assert
  (forall ((i1 Int) (i2 Int))
  (! (= (= (my_inf i1 i2) true) (< i1 i2)) :pattern ((my_inf i1 i2)) )))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (count_type count_type) Bool)

(declare-const dummy1 count_type)

(declare-datatypes ()
((count_type__ref (count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun to_rep ((x count_type)) Int (count_typeqtint x))

(declare-fun of_rep (Int) count_type)

;; inversion_axiom
  (assert
  (forall ((x count_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x count_type)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__p__my_sets__cursor__node count_type)))))
(define-fun us_split_fields_rec__p__my_sets__cursor__node__projection ((a us_split_fields)) count_type 
  (rec__p__my_sets__cursor__node a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__p__my_sets__cursor__node
                           (us_split_fields1 a))) (to_rep
                                                  (rec__p__my_sets__cursor__node
                                                  (us_split_fields1 b))))
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

(declare-const p__my_sets__cursor__node__first__bit Int)

(declare-const p__my_sets__cursor__node__last__bit Int)

(declare-const p__my_sets__cursor__node__position Int)

;; p__my_sets__cursor__node__first__bit_axiom
  (assert (<= 0 p__my_sets__cursor__node__first__bit))

;; p__my_sets__cursor__node__last__bit_axiom
  (assert
  (< p__my_sets__cursor__node__first__bit p__my_sets__cursor__node__last__bit))

;; p__my_sets__cursor__node__position_axiom
  (assert (<= 0 p__my_sets__cursor__node__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ()
((cursor__ref (cursor__refqtmk (cursor__content us_rep)))))
(define-fun cursor__ref_cursor__content__projection ((a cursor__ref)) us_rep 
  (cursor__content a))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__p__my_sets__set__capacity count_type)))))
(define-fun us_split_discrs_rec__p__my_sets__set__capacity__projection ((a us_split_discrs)) count_type 
  (rec__p__my_sets__set__capacity a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1 (rec__p__my_sets__set us_main_type)))))
(define-fun us_split_fields_rec__p__my_sets__set__projection ((a us_split_fields2)) us_main_type 
  (rec__p__my_sets__set a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1
 (us_repqtmk1
 (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__p__my_sets__set__capacity
                            (us_split_discrs1 a))) (to_rep
                                                   (rec__p__my_sets__set__capacity
                                                   (us_split_discrs1 b))))
                         (= (us_main_eq
                            (rec__p__my_sets__set (us_split_fields3 a))
                            (rec__p__my_sets__set (us_split_fields3 b))) true))
                    true false))

(define-fun in_range3 ((rec__p__my_sets__set__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__p__my_sets__set__capacity1 (to_rep
                                                               (rec__p__my_sets__set__capacity
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

(declare-const p__my_sets__set__capacity__first__bit Int)

(declare-const p__my_sets__set__capacity__last__bit Int)

(declare-const p__my_sets__set__capacity__position Int)

;; p__my_sets__set__capacity__first__bit_axiom
  (assert (<= 0 p__my_sets__set__capacity__first__bit))

;; p__my_sets__set__capacity__last__bit_axiom
  (assert
  (< p__my_sets__set__capacity__first__bit p__my_sets__set__capacity__last__bit))

;; p__my_sets__set__capacity__position_axiom
  (assert (<= 0 p__my_sets__set__capacity__position))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes () ((set__ref (set__refqtmk (set__content us_rep1)))))
(define-fun set__ref_set__content__projection ((a set__ref)) us_rep1 
  (set__content a))

(declare-fun length1 (us_rep1) Int)

(declare-fun length__function_guard (Int us_rep1) Bool)

(declare-fun oeq (us_rep1 us_rep1) Bool)

(declare-fun oeq__function_guard (Bool us_rep1 us_rep1) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep1) (b us_rep1))
  (! (= (user_eq3 a b) (oeq a b)) :pattern ((user_eq3 a b)) )))

(define-fun dynamic_invariant1 ((temp___expr_304 Int)
  (temp___is_init_300 Bool) (temp___skip_constant_301 Bool)
  (temp___do_toplevel_302 Bool)
  (temp___do_typ_inv_303 Bool)) Bool (=>
                                     (or (= temp___is_init_300 true)
                                     (<= 0 2147483647)) (in_range2
                                     temp___expr_304)))

;; length__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (let ((result (length1 container)))
     (and
     (<= result (to_rep
                (rec__p__my_sets__set__capacity (us_split_discrs1 container))))
     (dynamic_invariant1 result true false true true))) :pattern ((length1
                                                                  container)) )))

(declare-fun first_element (us_rep1) Int)

(declare-fun first_element__function_guard (Int us_rep1) Bool)

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep2 0)

(declare-fun bool_eq2 (us_rep2 us_rep2) Bool)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq4 (us_rep2 us_rep2) Bool)

(declare-const dummy4 us_rep2)

(declare-datatypes ()
((sequence__ref (sequence__refqtmk (sequence__content us_rep2)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep2 
  (sequence__content a))

(declare-fun get (us_rep2 Int) Int)

(declare-fun get__function_guard (Int us_rep2 Int) Bool)

;; temp___result_204'def
  (assert
  (forall ((container us_rep2) (item Int) (i Int)) (my_inf__function_guard
  (my_inf item (get container i)) item (get container i))))

(define-fun e_smaller_than_range ((container us_rep2) (fst Int) (lst Int)
  (item Int)) Bool (ite (forall ((i Int))
                        (=> (and (<= fst i) (<= i lst))
                        (= (my_inf item (get container i)) true)))
                   true false))

(declare-fun e_smaller_than_range__function_guard (Bool us_rep2 Int Int
  Int) Bool)

(declare-fun elements (us_rep1) us_rep2)

(declare-fun elements__function_guard (us_rep2 us_rep1) Bool)

(declare-fun is_empty (us_rep1) Bool)

(declare-fun is_empty__function_guard (Bool us_rep1) Bool)

(declare-sort element_type1 0)

(declare-fun element_typeqtint1 (element_type1) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type1))
  (and (<= 1 (element_typeqtint1 i)) (<= (element_typeqtint1 i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq5 (element_type1 element_type1) Bool)

(declare-const dummy5 element_type1)

(declare-datatypes ()
((element_type__ref1
 (element_type__refqtmk1 (element_type__content1 element_type1)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref1)) element_type1 
  (element_type__content1 a))

(define-fun dynamic_invariant2 ((temp___expr_293 Int)
  (temp___is_init_289 Bool) (temp___skip_constant_290 Bool)
  (temp___do_toplevel_291 Bool)
  (temp___do_typ_inv_292 Bool)) Bool (=>
                                     (or (= temp___is_init_289 true)
                                     (<= 1 100)) (in_range4 temp___expr_293)))

;; first_element__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (=> (not (= (is_empty container) true))
     (let ((result (first_element container)))
     (and
     (and (= result (get (elements container) 1))
     (= (e_smaller_than_range (elements container) 2 (length1 container)
        result) true))
     (dynamic_invariant2 result true false true true)))) :pattern ((first_element
                                                                   container)) )))

(declare-fun key (Int) Int)

(declare-fun key__function_guard (Int Int) Bool)

(declare-sort key_type 0)

(declare-fun key_typeqtint (key_type) Int)

;; key_type'axiom
  (assert
  (forall ((i key_type))
  (and (<= 1 (key_typeqtint i)) (<= (key_typeqtint i) 100))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq6 (key_type key_type) Bool)

(declare-const dummy6 key_type)

(declare-datatypes ()
((key_type__ref (key_type__refqtmk (key_type__content key_type)))))
(define-fun key_type__ref_key_type__content__2__projection ((a key_type__ref)) key_type 
  (key_type__content a))

(define-fun dynamic_invariant3 ((temp___expr_658 Int)
  (temp___is_init_654 Bool) (temp___skip_constant_655 Bool)
  (temp___do_toplevel_656 Bool)
  (temp___do_typ_inv_657 Bool)) Bool (=>
                                     (or (= temp___is_init_654 true)
                                     (<= 1 100)) (in_range5 temp___expr_658)))

;; key__post_axiom
  (assert
  (forall ((i Int))
  (! (=> (dynamic_invariant i true true true true)
     (let ((result (key i)))
     (=> (key__function_guard result i) (dynamic_invariant3 result true false
     true true)))) :pattern ((key i)) )))

;; key__def_axiom
  (assert
  (forall ((i Int))
  (! (=> (dynamic_invariant i true true true true) (= (key i) i)) :pattern (
  (key i)) )))

(declare-const container us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const key1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort key_type1 0)

(declare-fun key_typeqtint1 (key_type1) Int)

;; key_type'axiom
  (assert
  (forall ((i key_type1))
  (and (<= 1 (key_typeqtint1 i)) (<= (key_typeqtint1 i) 100))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq7 (key_type1 key_type1) Bool)

(declare-const dummy7 key_type1)

(declare-datatypes ()
((key_type__ref1 (key_type__refqtmk1 (key_type__content1 key_type1)))))
(define-fun key_type__ref_key_type__content__3__projection ((a key_type__ref1)) key_type1 
  (key_type__content1 a))

(define-fun dynamic_invariant4 ((temp___expr_665 Int)
  (temp___is_init_661 Bool) (temp___skip_constant_662 Bool)
  (temp___do_toplevel_663 Bool)
  (temp___do_typ_inv_664 Bool)) Bool (=>
                                     (or (= temp___is_init_661 true)
                                     (<= 1 100)) (in_range6 temp___expr_665)))

;; temp___result_157'def
  (assert
  (forall ((left Int) (right Int)) (my_inf__function_guard
  (my_inf left right) left right)))

;; temp___result_158'def
  (assert
  (forall ((left Int) (right Int)) (my_inf__function_guard
  (my_inf right left) right left)))

(define-fun equivalent_elements ((left Int)
  (right Int)) Bool (and (not (my_inf left right)) (not (my_inf right left))))

(declare-fun equivalent_elements__function_guard (Bool Int Int) Bool)

(declare-fun length2 (us_rep2) Int)

(declare-fun length__function_guard1 (Int us_rep2) Bool)

;; temp___result_202'def
  (assert
  (forall ((container1 us_rep2) (item Int) (i Int)) (my_inf__function_guard
  (my_inf (get container1 i) item) (get container1 i) item)))

(define-fun e_bigger_than_range ((container1 us_rep2) (fst Int) (lst Int)
  (item Int)) Bool (ite (forall ((i Int))
                        (=> (and (<= fst i) (<= i lst))
                        (= (my_inf (get container1 i) item) true)))
                   true false))

(declare-fun e_bigger_than_range__function_guard (Bool us_rep2 Int Int
  Int) Bool)

(define-fun e_is_find ((container1 us_rep2) (item Int)
  (position Int)) Bool (and (ite (< 0 position)
                            (e_bigger_than_range container1 1 (- position 1)
                            item) (distinct 1 0)) (ite (< position (length2
                                                                   container1))
                                                  (e_smaller_than_range
                                                  container1 (+ position 1)
                                                  (length2 container1) item)
                                                  (distinct 1 0))))

(declare-fun e_is_find__function_guard (Bool us_rep2 Int Int) Bool)

(declare-fun find (us_rep2 Int) Int)

(declare-fun find__function_guard (Int us_rep2 Int) Bool)

(define-fun last ((container1 us_rep2)) Int (+ 0 (length2 container1)))

(declare-fun last__function_guard (Int us_rep2) Bool)

(define-fun oeq1 ((left us_rep2)
  (right us_rep2)) Bool (and (= (length2 left) (length2 right)) (ite 
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

(declare-fun oeq__function_guard1 (Bool us_rep2 us_rep2) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep2) (b us_rep2))
  (! (= (user_eq4 a b) (oeq1 a b)) :pattern ((user_eq4 a b)) )))

(define-fun default_initial_assumption ((temp___expr_378 us_rep2)
  (temp___skip_top_level_379 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_379 true))
                                         (= (length2 temp___expr_378) 0)))

;; find__post_axiom
  (assert
  (forall ((container1 us_rep2))
  (forall ((item Int))
  (! (=> (dynamic_invariant2 item true true true true)
     (let ((result (find container1 item)))
     (and
     (=> (< 0 result)
     (and (<= result (length2 container1))
     (= (equivalent_elements item (get container1 result)) true)))
     (dynamic_invariant1 result true false true true)))) :pattern ((find
                                                                   container1
                                                                   item)) ))))

(define-fun e_elements_included ((left us_rep2)
  (right us_rep2)) Bool (ite (forall ((i Int))
                             (=> (and (<= 1 i) (<= i (length2 left)))
                             (and (< 0 (find right (get left i)))
                             (= (get right (find right (get left i))) 
                             (get left i)))))
                        true false))

(declare-fun e_elements_included__function_guard (Bool us_rep2 us_rep2) Bool)

(declare-sort us_main_type2 0)

(declare-fun us_main_eq2 (us_main_type2 us_main_type2) Bool)

(declare-sort us_rep3 0)

(declare-fun bool_eq3 (us_rep3 us_rep3) Bool)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-fun user_eq8 (us_rep3 us_rep3) Bool)

(declare-const dummy8 us_rep3)

(declare-datatypes () ((set__ref1 (set__refqtmk1 (set__content1 us_rep3)))))
(define-fun set__ref_set__content__2__projection ((a set__ref1)) us_rep3 
  (set__content1 a))

(declare-fun length3 (us_rep3) Int)

(declare-fun length__function_guard2 (Int us_rep3) Bool)

(declare-fun model1 (us_rep1) us_rep3)

(declare-fun model__function_guard (us_rep3 us_rep1) Bool)

(declare-fun oeq2 (us_rep3 us_rep3) Bool)

(declare-fun oeq__function_guard2 (Bool us_rep3 us_rep3) Bool)

(declare-fun is_empty1 (us_rep3) Bool)

(declare-fun is_empty__function_guard1 (Bool us_rep3) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep3) (b us_rep3))
  (! (= (user_eq8 a b) (oeq2 a b)) :pattern ((user_eq8 a b)) )))

(define-fun default_initial_assumption1 ((temp___expr_342 us_rep3)
  (temp___skip_top_level_343 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_343 true))
                                         (= (is_empty1 temp___expr_342) true)))

;; model__post_axiom
  (assert
  (forall ((container1 us_rep1))
  (! (= (length3 (model1 container1)) (length1 container1)) :pattern (
  (model1 container1)) )))

(declare-fun contains (us_rep3 Int) Bool)

(declare-fun contains__function_guard (Bool us_rep3 Int) Bool)

(define-fun iter_has_element ((container1 us_rep2)
  (position Int)) Bool (and (ite (<= 1 position) true false) (ite (<= position 
                                                             (last
                                                             container1))
                                                             true false)))

(declare-fun iter_has_element__function_guard (Bool us_rep2 Int) Bool)

(declare-sort element_type2 0)

(declare-fun element_typeqtint2 (element_type2) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type2))
  (and (<= 1 (element_typeqtint2 i)) (<= (element_typeqtint2 i) 100))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq9 (element_type2 element_type2) Bool)

(declare-const dummy9 element_type2)

(declare-datatypes ()
((element_type__ref2
 (element_type__refqtmk2 (element_type__content2 element_type2)))))
(define-fun element_type__ref_element_type__content__3__projection ((a element_type__ref2)) element_type2 
  (element_type__content2 a))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i))
  (<= (extended_indexqtint i) 2147483647))))

(define-fun in_range8 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq10 (extended_index extended_index) Bool)

(declare-const dummy10 extended_index)

(declare-datatypes ()
((extended_index__ref
 (extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

;; elements__post_axiom
  (assert
  (forall ((container1 us_rep1))
  (! (let ((result (elements container1)))
     (and
     (and
     (and (= (length2 result) (length1 container1))
     (forall ((temp___458 Int))
     (=>
     (and (in_range8 temp___458)
     (= (iter_has_element result temp___458) true))
     (= (contains (model1 container1) (get result temp___458)) true))))
     (forall ((item Int))
     (=> (and (in_range7 item) (= (contains (model1 container1) item) true))
     (and (< 0 (find result item))
     (= (equivalent_elements (get result (find result item)) item) true)))))
     (forall ((i Int))
     (=> (and (<= 1 i) (<= i (length1 container1)))
     (and (= (find result (get result i)) i)
     (= (e_is_find result (get result i) i) true)))))) :pattern ((elements
                                                                 container1)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep1) (right us_rep1))
  (! (ite (= (oeq left right) true)
     (= (oeq1 (elements left) (elements right)) true)
     (or
     (not (= (e_elements_included (elements left) (elements right)) true))
     (not (= (e_elements_included (elements right) (elements left)) true)))) :pattern (
  (oeq left right)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container1 us_rep1))
  (! (= (= (is_empty container1) true) (= (length1 container1) 0)) :pattern (
  (is_empty container1)) )))

(define-fun dynamic_invariant5 ((temp___expr_334 Int)
  (temp___is_init_330 Bool) (temp___skip_constant_331 Bool)
  (temp___do_toplevel_332 Bool)
  (temp___do_typ_inv_333 Bool)) Bool (=>
                                     (or (= temp___is_init_330 true)
                                     (<= 1 100)) (in_range7 temp___expr_334)))

;; contains__post_axiom
  (assert
  (forall ((container1 us_rep3))
  (forall ((item Int))
  (! (=> (dynamic_invariant5 item true true true true)
     (=> (= (distinct 1 0) true)
     (=>
     (exists ((e Int))
     (and (and (in_range7 e) (= (contains container1 e) true))
     (= (equivalent_elements e item) true)))
     (= (contains container1 item) true)))) :pattern ((contains container1
                                                      item)) ))))

;; length__post_axiom
  (assert
  (forall ((container1 us_rep3)) (! (dynamic_invariant1 (length3 container1)
  true false true true) :pattern ((length3 container1)) )))

(declare-fun ole (us_rep3 us_rep3) Bool)

(declare-fun ole__function_guard (Bool us_rep3 us_rep3) Bool)

;; ole__post_axiom
  (assert
  (forall ((left us_rep3) (right us_rep3))
  (! (= (= (ole left right) true)
     (forall ((item Int))
     (=> (and (in_range7 item) (= (contains left item) true))
     (= (contains right item) true)))) :pattern ((ole left right)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep3) (right us_rep3))
  (! (= (= (oeq2 left right) true)
     (and (= (ole left right) true) (= (ole right left) true))) :pattern (
  (oeq2 left right)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container1 us_rep3))
  (! (let ((result (is_empty1 container1)))
     (and
     (= (= result true)
     (forall ((item Int))
     (not (and (in_range7 item) (= (contains container1 item) true)))))
     (= (= result true) (= (length3 container1) 0)))) :pattern ((is_empty1
                                                                container1)) )))

(define-fun dynamic_invariant6 ((temp___expr_370 Int)
  (temp___is_init_366 Bool) (temp___skip_constant_367 Bool)
  (temp___do_toplevel_368 Bool)
  (temp___do_typ_inv_369 Bool)) Bool (=>
                                     (or (= temp___is_init_366 true)
                                     (<= 0 2147483647)) (in_range8
                                     temp___expr_370)))

;; length__post_axiom
  (assert
  (forall ((container1 us_rep2))
  (! (let ((result (length2 container1)))
     (and (<= (+ 0 result) 2147483647) (dynamic_invariant1 result true false
     true true))) :pattern ((length2 container1)) )))

(declare-sort element_type3 0)

(declare-fun element_typeqtint3 (element_type3) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type3))
  (and (<= 1 (element_typeqtint3 i)) (<= (element_typeqtint3 i) 100))))

(define-fun in_range9 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq11 (element_type3 element_type3) Bool)

(declare-const dummy11 element_type3)

(declare-datatypes ()
((element_type__ref3
 (element_type__refqtmk3 (element_type__content3 element_type3)))))
(define-fun element_type__ref_element_type__content__4__projection ((a element_type__ref3)) element_type3 
  (element_type__content3 a))

(define-fun dynamic_invariant7 ((temp___expr_363 Int)
  (temp___is_init_359 Bool) (temp___skip_constant_360 Bool)
  (temp___do_toplevel_361 Bool)
  (temp___do_typ_inv_362 Bool)) Bool (=>
                                     (or (= temp___is_init_359 true)
                                     (<= 1 100)) (in_range9 temp___expr_363)))

;; get__post_axiom
  (assert
  (forall ((container1 us_rep2))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant6 position true true true true)
     (and (<= 1 position) (<= position (last container1))))
     (dynamic_invariant7 (get container1 position) true false true true)) :pattern (
  (get container1 position)) ))))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant4 key1 true false true true))

(define-fun o () us_rep1 container)

(define-fun o1 () Int (length1 o))

;; H
  (assert (dynamic_invariant1 o1 true false true true))

;; H
  (assert
  (<= o1 (to_rep (rec__p__my_sets__set__capacity (us_split_discrs1 o)))))

;; H
  (assert (not (= o1 0)))

(define-fun o2 () us_rep1 container)

(assert
;; defqtvc
 ;; File "a-cforse.ads", line 1715, characters 0-0
  (not (not (= (is_empty o2) true))))
(check-sat)

(exit)
