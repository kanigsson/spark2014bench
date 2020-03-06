;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

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
  (forall ((x count_type)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__p__sets__cursor__node count_type)))))
(define-fun us_split_fields_rec__p__sets__cursor__node__projection ((a us_split_fields)) count_type 
  (rec__p__sets__cursor__node a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__p__sets__cursor__node (us_split_fields1 a))) 
                   (to_rep (rec__p__sets__cursor__node (us_split_fields1 b))))
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

(declare-const p__sets__cursor__node__first__bit Int)

(declare-const p__sets__cursor__node__last__bit Int)

(declare-const p__sets__cursor__node__position Int)

;; p__sets__cursor__node__first__bit_axiom
  (assert (<= 0 p__sets__cursor__node__first__bit))

;; p__sets__cursor__node__last__bit_axiom
  (assert
  (< p__sets__cursor__node__first__bit p__sets__cursor__node__last__bit))

;; p__sets__cursor__node__position_axiom
  (assert (<= 0 p__sets__cursor__node__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((cursor__ref 0))
(((cursor__refqtmk (cursor__content us_rep)))))
(define-fun cursor__ref_cursor__content__projection ((a cursor__ref)) us_rep 
  (cursor__content a))

(declare-const no_element us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

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

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content us_rep1)))))
(define-fun map__ref_map__content__projection ((a map__ref)) us_rep1 
  (map__content a))

(declare-datatypes ((key_type__ref 0))
(((key_type__refqtmk (key_type__content us_rep)))))
(define-fun key_type__ref_key_type__content__projection ((a key_type__ref)) us_rep 
  (key_type__content a))

(declare-fun get (us_rep1 us_rep) Int)

(declare-fun get__function_guard (Int us_rep1 us_rep) Bool)

(declare-fun has_key (us_rep1 us_rep) Bool)

(declare-fun has_key__function_guard (Bool us_rep1 us_rep) Bool)

(declare-fun witness (us_rep1 us_rep) Int)

(declare-fun witness__function_guard (Int us_rep1 us_rep) Bool)

(declare-fun w_get (us_rep1 Int) Int)

(declare-fun w_get__function_guard (Int us_rep1 Int) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= 1 (element_typeqtint i)) (<= (element_typeqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (element_type element_type) Bool)

(declare-const dummy3 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__4__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant ((temp___expr_376 Int)
  (temp___is_init_372 Bool) (temp___skip_constant_373 Bool)
  (temp___do_toplevel_374 Bool)
  (temp___do_typ_inv_375 Bool)) Bool (=>
                                     (or (= temp___is_init_372 true)
                                     (<= 1 2147483647)) (in_range2
                                     temp___expr_376)))

(declare-fun length1 (us_rep1) Int)

(declare-fun length__function_guard (Int us_rep1) Bool)

(declare-fun oeq (us_rep1 us_rep1) Bool)

(declare-fun oeq__function_guard (Bool us_rep1 us_rep1) Bool)

(declare-fun is_empty (us_rep1) Bool)

(declare-fun is_empty__function_guard (Bool us_rep1) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep1) (b us_rep1))
  (! (= (user_eq2 a b) (oeq a b)) :pattern ((user_eq2 a b)) )))

(define-fun default_initial_assumption ((temp___expr_384 us_rep1)
  (temp___skip_top_level_385 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_385 true))
                                         (and
                                         (= (is_empty temp___expr_384) true)
                                         (= (length1 temp___expr_384) 0))))

;; get__post_axiom
  (assert
  (forall ((container us_rep1))
  (forall ((key us_rep))
  (! (=> (= (has_key container key) true)
     (let ((result (get container key)))
     (and
     (=> (= (distinct 0 0) true)
     (and (= result (w_get container (witness container key)))
     (forall ((k us_rep))
     (=> (= (has_key container k) true)
     (= (= (bool_eq k key) true)
     (= (witness container key) (witness container k)))))))
     (dynamic_invariant result true false true true)))) :pattern ((get
                                                                  container
                                                                  key)) ))))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__p__sets__set__capacity count_type)))))
(define-fun us_split_discrs_rec__p__sets__set__capacity__projection ((a us_split_discrs)) count_type 
  (rec__p__sets__set__capacity a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__p__sets__set us_main_type1)))))
(define-fun us_split_fields_rec__p__sets__set__projection ((a us_split_fields2)) us_main_type1 
  (rec__p__sets__set a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk1
  (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__projection ((a us_rep2)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep2)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (to_rep
                            (rec__p__sets__set__capacity
                            (us_split_discrs1 a))) (to_rep
                                                   (rec__p__sets__set__capacity
                                                   (us_split_discrs1 b))))
                         (= (us_main_eq1
                            (rec__p__sets__set (us_split_fields3 a))
                            (rec__p__sets__set (us_split_fields3 b))) true))
                    true false))

(define-fun in_range3 ((rec__p__sets__set__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__p__sets__set__capacity1 (to_rep
                                                            (rec__p__sets__set__capacity
                                                            a))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const p__sets__set__capacity__first__bit Int)

(declare-const p__sets__set__capacity__last__bit Int)

(declare-const p__sets__set__capacity__position Int)

;; p__sets__set__capacity__first__bit_axiom
  (assert (<= 0 p__sets__set__capacity__first__bit))

;; p__sets__set__capacity__last__bit_axiom
  (assert
  (< p__sets__set__capacity__first__bit p__sets__set__capacity__last__bit))

;; p__sets__set__capacity__position_axiom
  (assert (<= 0 p__sets__set__capacity__position))

(declare-fun user_eq4 (us_rep2 us_rep2) Bool)

(declare-const dummy4 us_rep2)

(declare-datatypes ((set__ref 0))
(((set__refqtmk (set__content us_rep2)))))
(define-fun set__ref_set__content__projection ((a set__ref)) us_rep2 
  (set__content a))

(declare-fun positions (us_rep2) us_rep1)

(declare-fun positions__function_guard (us_rep1 us_rep2) Bool)

(declare-fun length2 (us_rep2) Int)

(declare-fun length__function_guard1 (Int us_rep2) Bool)

(declare-fun oeq1 (us_rep2 us_rep2) Bool)

(declare-fun oeq__function_guard1 (Bool us_rep2 us_rep2) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep2) (b us_rep2))
  (! (= (user_eq4 a b) (oeq1 a b)) :pattern ((user_eq4 a b)) )))

;; positions__post_axiom
  (assert
  (forall ((container us_rep2))
  (! (let ((result (positions container)))
     (and (not (= (has_key result no_element) true))
     (forall ((i us_rep))
     (=> (= (has_key result i) true)
     (and
     (let ((temp___439 (get result i)))
     (and (<= 1 temp___439) (<= temp___439 (length2 container))))
     (forall ((j us_rep))
     (=> (= (has_key result j) true)
     (=> (= (get result i) (get result j)) (= (bool_eq i j) true))))))))) :pattern (
  (positions container)) )))

(define-fun has_element ((container us_rep2)
  (position us_rep)) Bool (has_key (positions container) position))

(declare-fun has_element__function_guard (Bool us_rep2 us_rep) Bool)

(declare-const container us_rep2)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const position us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun less_than (Int Int) Bool)

(declare-fun less_than__function_guard (Bool Int Int) Bool)

(declare-sort t 0)

(declare-fun tqtint (t) Int)

;; t'axiom
  (assert (forall ((i t)) (and (<= 0 (tqtint i)) (<= (tqtint i) 10000))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq5 (t t) Bool)

(declare-const dummy5 t)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(define-fun dynamic_invariant1 ((temp___expr_265 Int)
  (temp___is_init_261 Bool) (temp___skip_constant_262 Bool)
  (temp___do_toplevel_263 Bool)
  (temp___do_typ_inv_264 Bool)) Bool (=>
                                     (or (= temp___is_init_261 true)
                                     (<= 0 10000)) (in_range4
                                     temp___expr_265)))

;; less_than__post_axiom
  (assert true)

;; less_than__def_axiom
  (assert
  (forall ((left Int) (right Int))
  (! (= (= (less_than left right) true) (< left right)) :pattern ((less_than
                                                                  left right)) )))

(define-fun dynamic_invariant2 ((temp___expr_285 Int)
  (temp___is_init_281 Bool) (temp___skip_constant_282 Bool)
  (temp___do_toplevel_283 Bool)
  (temp___do_typ_inv_284 Bool)) Bool (=>
                                     (or (= temp___is_init_281 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_285)))

;; temp___result_156'def
  (assert
  (forall ((left Int) (right Int)) (less_than__function_guard
  (less_than left right) left right)))

;; temp___result_157'def
  (assert
  (forall ((left Int) (right Int)) (less_than__function_guard
  (less_than right left) right left)))

(define-fun equivalent_elements ((left Int)
  (right Int)) Bool (and (not (less_than left right)) (not (less_than right
                                                           left))))

(declare-fun equivalent_elements__function_guard (Bool Int Int) Bool)

(declare-const rliteral count_type)

;; rliteral_axiom
  (assert (= (count_typeqtint rliteral) 0))

;; no_element__def_axiom
  (assert (= no_element (us_repqtmk (us_split_fieldsqtmk rliteral))))

;; length__post_axiom
  (assert
  (forall ((container1 us_rep2))
  (! (let ((result (length2 container1)))
     (and
     (<= result (to_rep
                (rec__p__sets__set__capacity (us_split_discrs1 container1))))
     (dynamic_invariant2 result true false true true))) :pattern ((length2
                                                                  container1)) )))

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

(declare-fun user_eq6 (us_rep3 us_rep3) Bool)

(declare-const dummy6 us_rep3)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep3)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep3 
  (sequence__content a))

(declare-fun length3 (us_rep3) Int)

(declare-fun length__function_guard2 (Int us_rep3) Bool)

(declare-fun get1 (us_rep3 Int) Int)

(declare-fun get__function_guard1 (Int us_rep3 Int) Bool)

;; temp___result_201'def
  (assert
  (forall ((container1 us_rep3) (item Int) (i Int))
  (less_than__function_guard (less_than (get1 container1 i) item)
  (get1 container1 i) item)))

(define-fun e_bigger_than_range ((container1 us_rep3) (fst Int) (lst Int)
  (item Int)) Bool (ite (forall ((i Int))
                        (=> (and (<= fst i) (<= i lst))
                        (= (less_than (get1 container1 i) item) true)))
                   true false))

(declare-fun e_bigger_than_range__function_guard (Bool us_rep3 Int Int
  Int) Bool)

;; temp___result_203'def
  (assert
  (forall ((container1 us_rep3) (item Int) (i Int))
  (less_than__function_guard (less_than item (get1 container1 i)) item
  (get1 container1 i))))

(define-fun e_smaller_than_range ((container1 us_rep3) (fst Int) (lst Int)
  (item Int)) Bool (ite (forall ((i Int))
                        (=> (and (<= fst i) (<= i lst))
                        (= (less_than item (get1 container1 i)) true)))
                   true false))

(declare-fun e_smaller_than_range__function_guard (Bool us_rep3 Int Int
  Int) Bool)

(define-fun e_is_find ((container1 us_rep3) (item Int)
  (position1 Int)) Bool (and (ite (< 0 position1)
                             (e_bigger_than_range container1 1
                             (- position1 1) item) (distinct 1 0)) (ite (< position1 
                                                                   (length3
                                                                   container1))
                                                                   (e_smaller_than_range
                                                                   container1
                                                                   (+ position1 1)
                                                                   (length3
                                                                   container1)
                                                                   item)
                                                                   (distinct 1 0))))

(declare-fun e_is_find__function_guard (Bool us_rep3 Int Int) Bool)

(declare-fun find (us_rep3 Int) Int)

(declare-fun find__function_guard (Int us_rep3 Int) Bool)

(declare-sort element_type1 0)

(declare-fun element_typeqtint1 (element_type1) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type1))
  (and (<= 0 (element_typeqtint1 i)) (<= (element_typeqtint1 i) 10000))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq7 (element_type1 element_type1) Bool)

(declare-const dummy7 element_type1)

(declare-datatypes ((element_type__ref1 0))
(((element_type__refqtmk1 (element_type__content1 element_type1)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref1)) element_type1 
  (element_type__content1 a))

(define-fun dynamic_invariant3 ((temp___expr_274 Int)
  (temp___is_init_270 Bool) (temp___skip_constant_271 Bool)
  (temp___do_toplevel_272 Bool)
  (temp___do_typ_inv_273 Bool)) Bool (=>
                                     (or (= temp___is_init_270 true)
                                     (<= 0 10000)) (in_range5
                                     temp___expr_274)))

(define-fun last ((container1 us_rep3)) Int (+ 0 (length3 container1)))

(declare-fun last__function_guard (Int us_rep3) Bool)

(define-fun oeq2 ((left us_rep3)
  (right us_rep3)) Bool (and (= (length3 left) (length3 right)) (ite 
                                                                (forall
                                                                ((n Int))
                                                                (=>
                                                                (and (<= 1 n)
                                                                (<= n 
                                                                (last left)))
                                                                (= (get1 left
                                                                   n) 
                                                                (get1 right
                                                                n)))) true
                                                                false)))

(declare-fun oeq__function_guard2 (Bool us_rep3 us_rep3) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep3) (b us_rep3))
  (! (= (user_eq6 a b) (oeq2 a b)) :pattern ((user_eq6 a b)) )))

(define-fun default_initial_assumption1 ((temp___expr_357 us_rep3)
  (temp___skip_top_level_358 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_358 true))
                                         (= (length3 temp___expr_357) 0)))

;; find__post_axiom
  (assert
  (forall ((container1 us_rep3))
  (forall ((item Int))
  (! (=> (dynamic_invariant3 item true true true true)
     (let ((result (find container1 item)))
     (and
     (=> (< 0 result)
     (and (<= result (length3 container1))
     (= (equivalent_elements item (get1 container1 result)) true)))
     (dynamic_invariant2 result true false true true)))) :pattern ((find
                                                                   container1
                                                                   item)) ))))

(define-fun e_elements_included ((left us_rep3)
  (right us_rep3)) Bool (ite (forall ((i Int))
                             (=> (and (<= 1 i) (<= i (length3 left)))
                             (and (< 0 (find right (get1 left i)))
                             (= (get1 right (find right (get1 left i))) 
                             (get1 left i)))))
                        true false))

(declare-fun e_elements_included__function_guard (Bool us_rep3 us_rep3) Bool)

(declare-sort us_main_type3 0)

(declare-fun us_main_eq3 (us_main_type3 us_main_type3) Bool)

(declare-sort us_rep4 0)

(declare-fun bool_eq4 (us_rep4 us_rep4) Bool)

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-fun user_eq8 (us_rep4 us_rep4) Bool)

(declare-const dummy8 us_rep4)

(declare-datatypes ((set__ref1 0))
(((set__refqtmk1 (set__content1 us_rep4)))))
(define-fun set__ref_set__content__2__projection ((a set__ref1)) us_rep4 
  (set__content1 a))

(declare-fun length4 (us_rep4) Int)

(declare-fun length__function_guard3 (Int us_rep4) Bool)

(declare-fun model1 (us_rep2) us_rep4)

(declare-fun model__function_guard (us_rep4 us_rep2) Bool)

(declare-fun oeq3 (us_rep4 us_rep4) Bool)

(declare-fun oeq__function_guard3 (Bool us_rep4 us_rep4) Bool)

(declare-fun is_empty1 (us_rep4) Bool)

(declare-fun is_empty__function_guard1 (Bool us_rep4) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep4) (b us_rep4))
  (! (= (user_eq8 a b) (oeq3 a b)) :pattern ((user_eq8 a b)) )))

(define-fun default_initial_assumption2 ((temp___expr_321 us_rep4)
  (temp___skip_top_level_322 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_322 true))
                                         (= (is_empty1 temp___expr_321) true)))

;; model__post_axiom
  (assert
  (forall ((container1 us_rep2))
  (! (= (length4 (model1 container1)) (length2 container1)) :pattern (
  (model1 container1)) )))

(declare-fun contains (us_rep4 Int) Bool)

(declare-fun contains__function_guard (Bool us_rep4 Int) Bool)

(define-fun iter_has_element ((container1 us_rep3)
  (position1 Int)) Bool (and (ite (<= 1 position1) true false) (ite (<= position1 
                                                               (last
                                                               container1))
                                                               true false)))

(declare-fun iter_has_element__function_guard (Bool us_rep3 Int) Bool)

(declare-fun elements (us_rep2) us_rep3)

(declare-fun elements__function_guard (us_rep3 us_rep2) Bool)

(declare-sort element_type2 0)

(declare-fun element_typeqtint2 (element_type2) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type2))
  (and (<= 0 (element_typeqtint2 i)) (<= (element_typeqtint2 i) 10000))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq9 (element_type2 element_type2) Bool)

(declare-const dummy9 element_type2)

(declare-datatypes ((element_type__ref2 0))
(((element_type__refqtmk2 (element_type__content2 element_type2)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref2)) element_type2 
  (element_type__content2 a))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i))
  (<= (extended_indexqtint i) 2147483647))))

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq10 (extended_index extended_index) Bool)

(declare-const dummy10 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

;; elements__post_axiom
  (assert
  (forall ((container1 us_rep2))
  (! (let ((result (elements container1)))
     (and
     (and
     (and (= (length3 result) (length2 container1))
     (forall ((temp___434 Int))
     (=>
     (and (in_range7 temp___434)
     (= (iter_has_element result temp___434) true))
     (= (contains (model1 container1) (get1 result temp___434)) true))))
     (forall ((item Int))
     (=> (and (in_range6 item) (= (contains (model1 container1) item) true))
     (and (< 0 (find result item))
     (= (equivalent_elements (get1 result (find result item)) item) true)))))
     (forall ((i Int))
     (=> (and (<= 1 i) (<= i (length2 container1)))
     (and (= (find result (get1 result i)) i)
     (= (e_is_find result (get1 result i) i) true)))))) :pattern ((elements
                                                                  container1)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep2) (right us_rep2))
  (! (ite (= (oeq1 left right) true)
     (= (oeq2 (elements left) (elements right)) true)
     (or
     (not (= (e_elements_included (elements left) (elements right)) true))
     (not (= (e_elements_included (elements right) (elements left)) true)))) :pattern (
  (oeq1 left right)) )))

(define-fun dynamic_invariant4 ((temp___expr_313 Int)
  (temp___is_init_309 Bool) (temp___skip_constant_310 Bool)
  (temp___do_toplevel_311 Bool)
  (temp___do_typ_inv_312 Bool)) Bool (=>
                                     (or (= temp___is_init_309 true)
                                     (<= 0 10000)) (in_range6
                                     temp___expr_313)))

;; contains__post_axiom
  (assert
  (forall ((container1 us_rep4))
  (forall ((item Int))
  (! (=> (dynamic_invariant4 item true true true true)
     (=> (= (distinct 1 0) true)
     (=>
     (exists ((e Int))
     (and (and (in_range6 e) (= (contains container1 e) true))
     (= (equivalent_elements e item) true)))
     (= (contains container1 item) true)))) :pattern ((contains container1
                                                      item)) ))))

;; length__post_axiom
  (assert
  (forall ((container1 us_rep4)) (! (dynamic_invariant2 (length4 container1)
  true false true true) :pattern ((length4 container1)) )))

(declare-fun ole (us_rep4 us_rep4) Bool)

(declare-fun ole__function_guard (Bool us_rep4 us_rep4) Bool)

;; ole__post_axiom
  (assert
  (forall ((left us_rep4) (right us_rep4))
  (! (= (= (ole left right) true)
     (forall ((item Int))
     (=> (and (in_range6 item) (= (contains left item) true))
     (= (contains right item) true)))) :pattern ((ole left right)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep4) (right us_rep4))
  (! (= (= (oeq3 left right) true)
     (and (= (ole left right) true) (= (ole right left) true))) :pattern (
  (oeq3 left right)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container1 us_rep4))
  (! (let ((result (is_empty1 container1)))
     (and
     (= (= result true)
     (forall ((item Int))
     (not (and (in_range6 item) (= (contains container1 item) true)))))
     (= (= result true) (= (length4 container1) 0)))) :pattern ((is_empty1
                                                                container1)) )))

(define-fun dynamic_invariant5 ((temp___expr_349 Int)
  (temp___is_init_345 Bool) (temp___skip_constant_346 Bool)
  (temp___do_toplevel_347 Bool)
  (temp___do_typ_inv_348 Bool)) Bool (=>
                                     (or (= temp___is_init_345 true)
                                     (<= 0 2147483647)) (in_range7
                                     temp___expr_349)))

;; length__post_axiom
  (assert
  (forall ((container1 us_rep3))
  (! (let ((result (length3 container1)))
     (and (<= (+ 0 result) 2147483647) (dynamic_invariant2 result true false
     true true))) :pattern ((length3 container1)) )))

(declare-sort element_type3 0)

(declare-fun element_typeqtint3 (element_type3) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type3))
  (and (<= 0 (element_typeqtint3 i)) (<= (element_typeqtint3 i) 10000))))

(define-fun in_range8 ((x Int)) Bool (and (<= 0 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq11 (element_type3 element_type3) Bool)

(declare-const dummy11 element_type3)

(declare-datatypes ((element_type__ref3 0))
(((element_type__refqtmk3 (element_type__content3 element_type3)))))
(define-fun element_type__ref_element_type__content__3__projection ((a element_type__ref3)) element_type3 
  (element_type__content3 a))

(define-fun dynamic_invariant6 ((temp___expr_342 Int)
  (temp___is_init_338 Bool) (temp___skip_constant_339 Bool)
  (temp___do_toplevel_340 Bool)
  (temp___do_typ_inv_341 Bool)) Bool (=>
                                     (or (= temp___is_init_338 true)
                                     (<= 0 10000)) (in_range8
                                     temp___expr_342)))

;; get__post_axiom
  (assert
  (forall ((container1 us_rep3))
  (forall ((position1 Int))
  (! (=>
     (and (dynamic_invariant5 position1 true true true true)
     (and (<= 1 position1) (<= position1 (last container1))))
     (dynamic_invariant6 (get1 container1 position1) true false true true)) :pattern (
  (get1 container1 position1)) ))))

;; has_key__post_axiom
  (assert
  (forall ((container1 us_rep1))
  (forall ((key us_rep))
  (! (=> (= (distinct 0 0) true)
     (=>
     (exists ((k us_rep))
     (and (= (has_key container1 k) true) (= (bool_eq k key) true)))
     (= (has_key container1 key) true))) :pattern ((has_key container1 key)) ))))

;; length__post_axiom
  (assert
  (forall ((container1 us_rep1)) (! (dynamic_invariant2 (length1 container1)
  true false true true) :pattern ((length1 container1)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep1) (right us_rep1))
  (! (= (= (oeq left right) true)
     (and
     (forall ((key us_rep))
     (=> (= (has_key left key) true)
     (and (= (has_key right key) true) (= (get right key) (get left key)))))
     (forall ((key us_rep))
     (=> (= (has_key right key) true) (= (has_key left key) true))))) :pattern (
  (oeq left right)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container1 us_rep1))
  (! (= (= (is_empty container1) true)
     (forall ((key us_rep)) (not (= (has_key container1 key) true)))) :pattern (
  (is_empty container1)) )))

(declare-fun has_witness (us_rep1 Int) Bool)

(declare-fun has_witness__function_guard (Bool us_rep1 Int) Bool)

;; has_witness__post_axiom
  (assert true)

;; witness__post_axiom
  (assert
  (forall ((container1 us_rep1))
  (forall ((key us_rep))
  (! (=> (= (has_key container1 key) true)
     (let ((result (witness container1 key)))
     (and (= (has_witness container1 result) true) (dynamic_invariant2 result
     true false true true)))) :pattern ((witness container1 key)) ))))

;; w_get__post_axiom
  (assert
  (forall ((container1 us_rep1))
  (forall ((witness1 Int))
  (! (=>
     (and (dynamic_invariant2 witness1 true true true true)
     (= (has_witness container1 witness1) true)) (dynamic_invariant
     (w_get container1 witness1) true false true true)) :pattern ((w_get
                                                                  container1
                                                                  witness1)) ))))

(assert
;; defqtvc
 ;; File "a-cforse.ads", line 1361, characters 0-0
  (not
  (=> (= (us_repqtmk (us_split_fieldsqtmk rliteral)) no_element)
  (=>
  (or (= (has_element container position) true)
  (= (bool_eq position no_element) true))
  (=> (not (= (bool_eq position no_element) true))
  (let ((o container))
  (let ((o1 (positions o)))
  (=>
  (and (not (= (has_key o1 no_element) true))
  (forall ((i us_rep))
  (=> (= (has_key o1 i) true)
  (and
  (let ((temp___436 (get o1 i)))
  (and (<= 1 temp___436) (<= temp___436 (length2 o))))
  (forall ((j us_rep))
  (=> (= (has_key o1 j) true)
  (=> (= (get o1 i) (get o1 j)) (= (bool_eq i j) true))))))))
  (= (has_key o1 position) true)))))))))
(check-sat)