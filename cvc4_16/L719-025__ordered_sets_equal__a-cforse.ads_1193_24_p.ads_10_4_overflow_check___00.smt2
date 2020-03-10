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

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (count_type count_type) Bool)

(declare-const dummy count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
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
  (forall ((x count_type)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__p__my_sets__set__capacity count_type)))))
(define-fun us_split_discrs_rec__p__my_sets__set__capacity__projection ((a us_split_discrs)) count_type 
  (rec__p__my_sets__set__capacity a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__p__my_sets__set us_main_type)))))
(define-fun us_split_fields_rec__p__my_sets__set__projection ((a us_split_fields)) us_main_type 
  (rec__p__my_sets__set a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__p__my_sets__set__capacity
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__p__my_sets__set__capacity
                                                  (us_split_discrs1 b))))
                        (= (us_main_eq
                           (rec__p__my_sets__set (us_split_fields1 a))
                           (rec__p__my_sets__set (us_split_fields1 b))) true))
                   true false))

(define-fun in_range1 ((rec__p__my_sets__set__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__p__my_sets__set__capacity1 (to_rep
                                                               (rec__p__my_sets__set__capacity
                                                               a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

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

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((set__ref 0))
(((set__refqtmk (set__content us_rep)))))
(define-fun set__ref_set__content__projection ((a set__ref)) us_rep (set__content
                                                                    a))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(declare-fun oeq (us_rep us_rep) Bool)

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq1 a b) (oeq a b)) :pattern ((user_eq1 a b)) )))

(define-fun dynamic_invariant ((temp___expr_275 Int)
  (temp___is_init_271 Bool) (temp___skip_constant_272 Bool)
  (temp___do_toplevel_273 Bool)
  (temp___do_typ_inv_274 Bool)) Bool (=>
                                     (or (= temp___is_init_271 true)
                                     (<= 0 2147483647)) (in_range
                                     temp___expr_275)))

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length container)))
     (and
     (<= result (to_rep
                (rec__p__my_sets__set__capacity (us_split_discrs1 container))))
     (dynamic_invariant result true false true true))) :pattern ((length
                                                                 container)) )))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep1 0)

(declare-fun bool_eq1 (us_rep1 us_rep1) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((set__ref1 0))
(((set__refqtmk1 (set__content1 us_rep1)))))
(define-fun set__ref_set__content__2__projection ((a set__ref1)) us_rep1 
  (set__content1 a))

(declare-sort us_main_type2 0)

(declare-fun us_main_eq2 (us_main_type2 us_main_type2) Bool)

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

(declare-fun user_eq3 (us_rep2 us_rep2) Bool)

(declare-const dummy3 us_rep2)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep2)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep2 
  (sequence__content a))

(declare-fun model1 (us_rep) us_rep1)

(declare-fun model__function_guard (us_rep1 us_rep) Bool)

(declare-fun length1 (us_rep1) Int)

(declare-fun length__function_guard1 (Int us_rep1) Bool)

(declare-fun oeq1 (us_rep1 us_rep1) Bool)

(declare-fun oeq__function_guard1 (Bool us_rep1 us_rep1) Bool)

(declare-fun is_empty (us_rep1) Bool)

(declare-fun is_empty__function_guard (Bool us_rep1) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep1) (b us_rep1))
  (! (= (user_eq2 a b) (oeq1 a b)) :pattern ((user_eq2 a b)) )))

(define-fun default_initial_assumption ((temp___expr_313 us_rep1)
  (temp___skip_top_level_314 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_314 true))
                                         (= (is_empty temp___expr_313) true)))

;; model__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (length1 (model1 container)) (length container)) :pattern ((model1
                                                                   container)) )))

(declare-fun elements (us_rep) us_rep2)

(declare-fun elements__function_guard (us_rep2 us_rep) Bool)

(define-fun in_range2 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(define-fun length2 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(declare-fun my_lt__function_guard (Bool Int Int) Bool)

(define-fun equivalent_elements ((left Int)
  (right Int)) Bool (and (not (< left right)) (not (< right left))))

(declare-fun equivalent_elements__function_guard (Bool Int Int) Bool)

(declare-fun contains (us_rep1 Int) Bool)

(declare-fun contains__function_guard (Bool us_rep1 Int) Bool)

(declare-fun length3 (us_rep2) Int)

(declare-fun length__function_guard2 (Int us_rep2) Bool)

(declare-fun get (us_rep2 Int) Int)

(declare-fun get__function_guard (Int us_rep2 Int) Bool)

(define-fun last ((container us_rep2)) Int (+ 0 (length3 container)))

(declare-fun last__function_guard (Int us_rep2) Bool)

(define-fun iter_has_element ((container us_rep2)
  (position Int)) Bool (and (ite (<= 1 position) true false) (ite (<= position 
                                                             (last container))
                                                             true false)))

(declare-fun iter_has_element__function_guard (Bool us_rep2 Int) Bool)

(define-fun e_bigger_than_range ((container us_rep2) (fst Int) (lst Int)
  (item Int)) Bool (ite (forall ((i Int))
                        (=> (and (<= fst i) (<= i lst))
                        (= (< (get container i) item) true)))
                   true false))

(declare-fun e_bigger_than_range__function_guard (Bool us_rep2 Int Int
  Int) Bool)

(define-fun e_smaller_than_range ((container us_rep2) (fst Int) (lst Int)
  (item Int)) Bool (ite (forall ((i Int))
                        (=> (and (<= fst i) (<= i lst))
                        (= (< item (get container i)) true)))
                   true false))

(declare-fun e_smaller_than_range__function_guard (Bool us_rep2 Int Int
  Int) Bool)

(define-fun e_is_find ((container us_rep2) (item Int)
  (position Int)) Bool (and (ite (< 0 position)
                            (e_bigger_than_range container 1 (- position 1)
                            item) (distinct 1 0)) (ite (< position (length3
                                                                   container))
                                                  (e_smaller_than_range
                                                  container (+ position 1)
                                                  (length3 container) item)
                                                  (distinct 1 0))))

(declare-fun e_is_find__function_guard (Bool us_rep2 Int Int) Bool)

(declare-fun find (us_rep2 Int) Int)

(declare-fun find__function_guard (Int us_rep2 Int) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= 1 (element_typeqtint i)) (<= (element_typeqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq4 (element_type element_type) Bool)

(declare-const dummy4 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__3__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i))
  (<= (extended_indexqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq5 (extended_index extended_index) Bool)

(declare-const dummy5 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun oeq2 ((left us_rep2)
  (right us_rep2)) Bool (and (= (length3 left) (length3 right)) (ite 
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

(declare-fun oeq__function_guard2 (Bool us_rep2 us_rep2) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep2) (b us_rep2))
  (! (= (user_eq3 a b) (oeq2 a b)) :pattern ((user_eq3 a b)) )))

(define-fun default_initial_assumption1 ((temp___expr_349 us_rep2)
  (temp___skip_top_level_350 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_350 true))
                                         (= (length3 temp___expr_349) 0)))

;; elements__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (elements container)))
     (and
     (and
     (and (= (length3 result) (length container))
     (forall ((temp___425 Int))
     (=>
     (and (in_range4 temp___425)
     (= (iter_has_element result temp___425) true))
     (= (contains (model1 container) (get result temp___425)) true))))
     (forall ((item Int))
     (=> (and (in_range3 item) (= (contains (model1 container) item) true))
     (and (< 0 (find result item))
     (= (equivalent_elements (get result (find result item)) item) true)))))
     (forall ((i Int))
     (=> (and (<= 1 i) (<= i (length container)))
     (and (= (find result (get result i)) i)
     (= (e_is_find result (get result i) i) true)))))) :pattern ((elements
                                                                 container)) )))

(declare-fun intersection1 (us_rep us_rep) us_rep)

(declare-fun intersection__function_guard (us_rep us_rep us_rep) Bool)

(declare-fun ole (us_rep1 us_rep1) Bool)

(declare-fun ole__function_guard (Bool us_rep1 us_rep1) Bool)

(declare-fun includes_intersection (us_rep1 us_rep1 us_rep1) Bool)

(declare-fun includes_intersection__function_guard (Bool us_rep1 us_rep1
  us_rep1) Bool)

(declare-fun num_overlaps (us_rep1 us_rep1) Int)

(declare-fun num_overlaps__function_guard (Int us_rep1 us_rep1) Bool)

(define-fun e_elements_included ((left us_rep2)
  (right us_rep2)) Bool (ite (forall ((i Int))
                             (=> (and (<= 1 i) (<= i (length3 left)))
                             (and (< 0 (find right (get left i)))
                             (= (get right (find right (get left i))) 
                             (get left i)))))
                        true false))

(declare-fun e_elements_included__function_guard (Bool us_rep2 us_rep2) Bool)

(define-fun e_elements_included1 ((left us_rep2) (model2 us_rep1)
  (right us_rep2)) Bool (ite (forall ((i Int))
                             (=> (and (<= 1 i) (<= i (length3 left)))
                             (=> (= (contains model2 (get left i)) true)
                             (and (< 0 (find right (get left i)))
                             (= (get right (find right (get left i))) 
                             (get left i))))))
                        true false))

(declare-fun e_elements_included__function_guard1 (Bool us_rep2 us_rep1
  us_rep2) Bool)

;; intersection__post_axiom
  (assert
  (forall ((left us_rep) (right us_rep))
  (! (let ((result (intersection1 left right)))
     (and
     (and
     (and
     (and
     (and (= (length result) (num_overlaps (model1 left) (model1 right)))
     (= (ole (model1 result) (model1 left)) true))
     (= (ole (model1 result) (model1 right)) true))
     (= (includes_intersection (model1 result) (model1 left) (model1 right)) true))
     (= (e_elements_included (elements result) (elements left)) true))
     (= (e_elements_included1 (elements left) (model1 right)
        (elements result)) true))) :pattern ((intersection1 left right)) )))

(declare-const target__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const source us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort tcount_typeB 0)

(declare-fun tcount_typeBqtint (tcount_typeB) Int)

;; tcount_typeB'axiom
  (assert
  (forall ((i tcount_typeB))
  (and (<= (- 2147483648) (tcount_typeBqtint i))
  (<= (tcount_typeBqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq6 (tcount_typeB tcount_typeB) Bool)

(declare-const dummy6 tcount_typeB)

(declare-datatypes ((tcount_typeB__ref 0))
(((tcount_typeB__refqtmk (tcount_typeB__content tcount_typeB)))))
(define-fun tcount_typeB__ref_tcount_typeB__content__projection ((a tcount_typeB__ref)) tcount_typeB 
  (tcount_typeB__content a))

(declare-sort element_type1 0)

(declare-fun element_typeqtint1 (element_type1) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type1))
  (and (<= 1 (element_typeqtint1 i)) (<= (element_typeqtint1 i) 100))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq7 (element_type1 element_type1) Bool)

(declare-const dummy7 element_type1)

(declare-datatypes ((element_type__ref1 0))
(((element_type__refqtmk1 (element_type__content1 element_type1)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref1)) element_type1 
  (element_type__content1 a))

(define-fun dynamic_invariant1 ((temp___expr_268 Int)
  (temp___is_init_264 Bool) (temp___skip_constant_265 Bool)
  (temp___do_toplevel_266 Bool)
  (temp___do_typ_inv_267 Bool)) Bool (=>
                                     (or (= temp___is_init_264 true)
                                     (<= 1 100)) (in_range6 temp___expr_268)))

;; find__post_axiom
  (assert
  (forall ((container us_rep2))
  (forall ((item Int))
  (! (=> (dynamic_invariant1 item true true true true)
     (let ((result (find container item)))
     (and
     (=> (< 0 result)
     (and (<= result (length3 container))
     (= (equivalent_elements item (get container result)) true)))
     (dynamic_invariant result true false true true)))) :pattern ((find
                                                                  container
                                                                  item)) ))))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep) (right us_rep))
  (! (ite (= (oeq left right) true)
     (= (oeq2 (elements left) (elements right)) true)
     (or
     (not (= (e_elements_included (elements left) (elements right)) true))
     (not (= (e_elements_included (elements right) (elements left)) true)))) :pattern (
  (oeq left right)) )))

(define-fun dynamic_invariant2 ((temp___expr_305 Int)
  (temp___is_init_301 Bool) (temp___skip_constant_302 Bool)
  (temp___do_toplevel_303 Bool)
  (temp___do_typ_inv_304 Bool)) Bool (=>
                                     (or (= temp___is_init_301 true)
                                     (<= 1 100)) (in_range3 temp___expr_305)))

;; contains__post_axiom
  (assert
  (forall ((container us_rep1))
  (forall ((item Int))
  (! (=> (dynamic_invariant2 item true true true true)
     (=> (= (distinct 1 0) true)
     (=>
     (exists ((e Int))
     (and (and (in_range3 e) (= (contains container e) true))
     (= (equivalent_elements e item) true)))
     (= (contains container item) true)))) :pattern ((contains container
                                                     item)) ))))

;; length__post_axiom
  (assert
  (forall ((container us_rep1)) (! (dynamic_invariant (length1 container)
  true false true true) :pattern ((length1 container)) )))

;; ole__post_axiom
  (assert
  (forall ((left us_rep1) (right us_rep1))
  (! (= (= (ole left right) true)
     (forall ((item Int))
     (=> (and (in_range3 item) (= (contains left item) true))
     (= (contains right item) true)))) :pattern ((ole left right)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep1) (right us_rep1))
  (! (= (= (oeq1 left right) true)
     (and (= (ole left right) true) (= (ole right left) true))) :pattern (
  (oeq1 left right)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (let ((result (is_empty container)))
     (and
     (= (= result true)
     (forall ((item Int))
     (not (and (in_range3 item) (= (contains container item) true)))))
     (= (= result true) (= (length1 container) 0)))) :pattern ((is_empty
                                                               container)) )))

;; includes_intersection__post_axiom
  (assert
  (forall ((container us_rep1) (left us_rep1) (right us_rep1))
  (! (= (= (includes_intersection container left right) true)
     (forall ((item Int))
     (=> (and (in_range3 item) (= (contains left item) true))
     (=> (= (contains right item) true) (= (contains container item) true))))) :pattern (
  (includes_intersection container left right)) )))

(declare-fun no_overlap (us_rep1 us_rep1) Bool)

(declare-fun no_overlap__function_guard (Bool us_rep1 us_rep1) Bool)

;; no_overlap__post_axiom
  (assert
  (forall ((left us_rep1) (right us_rep1))
  (! (= (= (no_overlap left right) true)
     (forall ((item Int))
     (=> (and (in_range3 item) (= (contains left item) true))
     (not (= (contains right item) true))))) :pattern ((no_overlap left
                                                       right)) )))

(declare-fun intersection2 (us_rep1 us_rep1) us_rep1)

(declare-fun intersection__function_guard1 (us_rep1 us_rep1 us_rep1) Bool)

;; num_overlaps__post_axiom
  (assert
  (forall ((left us_rep1) (right us_rep1))
  (! (let ((result (num_overlaps left right)))
     (and
     (and
     (and
     (and (= result (length1 (intersection2 left right)))
     (ite (= (ole left right) true) (= result (length1 left))
     (< result (length1 left))))
     (ite (= (ole right left) true) (= result (length1 right))
     (< result (length1 right))))
     (= (= result 0) (= (no_overlap left right) true))) (dynamic_invariant
     result true false true true))) :pattern ((num_overlaps left right)) )))

;; intersection__post_axiom
  (assert
  (forall ((left us_rep1) (right us_rep1))
  (! (let ((result (intersection2 left right)))
     (and (and (= (ole result left) true) (= (ole result right) true))
     (= (includes_intersection result left right) true))) :pattern ((intersection2
                                                                    left
                                                                    right)) )))

(define-fun dynamic_invariant3 ((temp___expr_341 Int)
  (temp___is_init_337 Bool) (temp___skip_constant_338 Bool)
  (temp___do_toplevel_339 Bool)
  (temp___do_typ_inv_340 Bool)) Bool (=>
                                     (or (= temp___is_init_337 true)
                                     (<= 0 2147483647)) (in_range4
                                     temp___expr_341)))

;; length__post_axiom
  (assert
  (forall ((container us_rep2))
  (! (let ((result (length3 container)))
     (and (<= (+ 0 result) 2147483647) (dynamic_invariant result true false
     true true))) :pattern ((length3 container)) )))

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

(declare-fun user_eq8 (element_type2 element_type2) Bool)

(declare-const dummy8 element_type2)

(declare-datatypes ((element_type__ref2 0))
(((element_type__refqtmk2 (element_type__content2 element_type2)))))
(define-fun element_type__ref_element_type__content__4__projection ((a element_type__ref2)) element_type2 
  (element_type__content2 a))

(define-fun dynamic_invariant4 ((temp___expr_334 Int)
  (temp___is_init_330 Bool) (temp___skip_constant_331 Bool)
  (temp___do_toplevel_332 Bool)
  (temp___do_typ_inv_333 Bool)) Bool (=>
                                     (or (= temp___is_init_330 true)
                                     (<= 1 100)) (in_range7 temp___expr_334)))

;; get__post_axiom
  (assert
  (forall ((container us_rep2))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant3 position true true true true)
     (and (<= 1 position) (<= position (last container))))
     (dynamic_invariant4 (get container position) true false true true)) :pattern (
  (get container position)) ))))

(assert
;; defqtvc
 ;; File "a-cforse.ads", line 1190, characters 0-0
  (not
  (forall ((target__split_fields us_main_type))
  (let ((o source))
  (let ((o1 (us_repqtmk target__split_discrs
            (us_split_fieldsqtmk target__split_fields))))
  (let ((o2 (intersection1 o1 o)))
  (=>
  (and
  (and
  (and
  (and
  (and (= (length o2) (num_overlaps (model1 o1) (model1 o)))
  (= (ole (model1 o2) (model1 o1)) true))
  (= (ole (model1 o2) (model1 o)) true))
  (= (includes_intersection (model1 o2) (model1 o1) (model1 o)) true))
  (= (e_elements_included (elements o2) (elements o1)) true))
  (= (e_elements_included1 (elements o1) (model1 o) (elements o2)) true))
  (let ((o3 (length o2)))
  (=>
  (and (dynamic_invariant o3 true false true true)
  (<= o3 (to_rep (rec__p__my_sets__set__capacity (us_split_discrs1 o2)))))
  (let ((o4 (length
            (us_repqtmk target__split_discrs
            (us_split_fieldsqtmk target__split_fields)))))
  (=>
  (and (dynamic_invariant o4 true false true true)
  (<= o4 (to_rep (rec__p__my_sets__set__capacity target__split_discrs))))
  (forall ((o5 Int))
  (=> (= (to_rep (rec__p__my_sets__set__capacity target__split_discrs)) o5)
  (let ((o6 (- o5 o4)))
  (=> (in_range5 o6)
  (=> (in_range5 (+ o6 o3))
  (let ((o7 source))
  (let ((o8 (us_repqtmk target__split_discrs
            (us_split_fieldsqtmk target__split_fields))))
  (let ((o9 (intersection1 o8 o7)))
  (=>
  (and
  (and
  (and
  (and
  (and (= (length o9) (num_overlaps (model1 o8) (model1 o7)))
  (= (ole (model1 o9) (model1 o8)) true))
  (= (ole (model1 o9) (model1 o7)) true))
  (= (includes_intersection (model1 o9) (model1 o8) (model1 o7)) true))
  (= (e_elements_included (elements o9) (elements o8)) true))
  (= (e_elements_included1 (elements o8) (model1 o7) (elements o9)) true))
  (let ((o10 (length o9)))
  (=>
  (and (dynamic_invariant o10 true false true true)
  (<= o10 (to_rep (rec__p__my_sets__set__capacity (us_split_discrs1 o9)))))
  (let ((o11 source))
  (let ((o12 (length o11)))
  (=>
  (and (dynamic_invariant o12 true false true true)
  (<= o12 (to_rep (rec__p__my_sets__set__capacity (us_split_discrs1 o11)))))
  (in_range5 (- o12 o10)))))))))))))))))))))))))))
(check-sat)
(exit)
